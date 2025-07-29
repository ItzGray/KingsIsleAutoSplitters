state("WizardGraphicalClient") {}

startup {
	settings.Add("starttimer", true, "Auto-Start timer");
	settings.Add("loadtimeremoval", true, "Load Time Removal");
	settings.Add("autosplitting", true, "Auto-Splitting");
	settings.Add("category", true, "Category Endings", "autosplitting");
	settings.Add("wizardcitycat", false, "Wizard City%", "category");
	settings.Add("harvestlordcat", false, "Harvest Lord%", "category");
	settings.Add("generalakillescat", false, "General Akilles%", "category");
	settings.Add("alicaneswiftarrowcat", false, "Alicane Swiftarrow%", "category");
	settings.Add("gobblerkingcat", false, "Gobbler King%", "category");
	settings.Add("categoryextensions", true, "Category Extensions", "category");
	settings.Add("diecat", false, "Die%", "categoryextensions");
	settings.Add("krakencat", false, "Kraken%", "categoryextensions");
	settings.Add("majorbosssplits", true, "Major Bosses", "autosplitting");
	settings.Add("rattlebonessplit", false, "Rattlebones", "majorbosssplits");
	settings.Add("juddsplit", false, "Old Judd", "majorbosssplits");
	settings.Add("gasplit", false, "General Akilles", "majorbosssplits");
	settings.Add("hlsplit", false, "Harvest Lord", "majorbosssplits");
	settings.Add("bgsplit", false, "Bastilla Gravewynd", "majorbosssplits");
	settings.Add("assplit", false, "Alicane Swiftarrow", "majorbosssplits");
	settings.Add("foulgazesplit", false, "Foulgaze", "majorbosssplits");
	settings.Add("lnsplit", false, "Lord Nightshade", "majorbosssplits");
	settings.Add("princesplit", false, "Prince Gobblestone", "majorbosssplits");
	settings.Add("baronsplit", false, "Barons Greebly and Rotunda", "majorbosssplits");
	settings.Add("unicornwaymisc", true, "Unicorn Way", "autosplitting");
	settings.Add("soulsplit", false, "Lost Souls", "unicornwaymisc");
	settings.Add("piratesplit", false, "Skeletal Pirates", "unicornwaymisc");
	settings.Add("fairysplit", false, "Dark Fairies", "unicornwaymisc");
	settings.Add("cyclopslanemisc", true, "Cyclops Lane", "autosplitting");
	settings.Add("trollsplit", false, "Lumbering Trolls", "cyclopslanemisc");
	settings.Add("cyrussplit", false, "Cyrus' Laundry", "cyclopslanemisc");
	settings.Add("bubblesplit", false, "Bubbles", "cyclopslanemisc");
	settings.Add("warhornsplit", false, "Warhorns", "cyclopslanemisc");
	settings.Add("tritonavenuemisc", true, "Triton Avenue", "autosplitting");
	settings.Add("minionsplit1", false, "Haunted Minions", "tritonavenuemisc");
	settings.Add("eelsplit1", false, "Electric Eel", "tritonavenuemisc");
	settings.Add("foddersplit1", false, "Rotting Fodders", "tritonavenuemisc");
	settings.Add("screamersplit", false, "Scarlet Screamers", "tritonavenuemisc");
	settings.Add("firecatalleymisc", true, "Firecat Alley", "autosplitting");
	settings.Add("minionsplit2", false, "Haunted Minions", "firecatalleymisc");
	settings.Add("elfhuntersplit", false, "Fire Elf Hunters", "firecatalleymisc");
	settings.Add("magmamansplit", false, "Magma Men", "firecatalleymisc");
	settings.Add("hauntedcavemisc", true, "Haunted Cave", "autosplitting");
	settings.Add("fieldguardsplit", false, "Field Guards", "hauntedcavemisc");
	settings.Add("colossusmisc", true, "Colossus Boulevard", "autosplitting");
	settings.Add("scavengersnowmensplit", false, "Gobbler Scavengers/Evil Snowmen", "colossusmisc");
	settings.Add("scoutersplit", false, "Gobbler Scouters", "colossusmisc");
	settings.Add("gorgergluttonmunchersplit", false, "Gobbler Gorgers/Gluttons/Munchers", "colossusmisc");
	settings.Add("krakenmisc", true, "Kraken%", "autosplitting");
	settings.Add("eelsplit2", false, "Electric Eels", "krakenmisc");
	settings.Add("barrelsplit", false, "Barrels", "krakenmisc");
	settings.Add("foddersplit2", false, "Rotting Fodder", "krakenmisc");
}

init {
	vars.loading = false;
	var logPath = Path.GetDirectoryName(modules.First().FileName).ToString() + "\\WizardClient.log";
	if (File.Exists(logPath)) {
		try {
			vars.reader = new StreamReader(new FileStream(logPath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite));
			vars.line = vars.reader.ReadToEnd();
			print("Connected successfully to " + logPath);
		}
		catch {
			print("Failed to connect to " + logPath);
			vars.reader = null;
			vars.line = null;
		}
	} 
	else {
		print("Couldn't find log file path");
		vars.reader = null;
		vars.line = null;
	}
}

update {
	while (vars.reader != null) {
		vars.line = vars.reader.ReadToEnd();
		if (vars.line == null || vars.line == "") {
			return false;
		}
		break;
	}
}

start {
	vars.loading = false;
	if (settings["starttimer"]) {
		if (vars.line.Contains("[DBGM] CORE_SEER       GameClient::MSG_CharacterSelected: Error=0, PrepPhase=1")) {
			vars.loading = true;
			return true;
		}
	}
	else {
		return false;
	}
}

split {
	return (
		// Category Splits
		// All category splits except Die% are slightly inaccurate
		(settings["wizardcitycat"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/MerleAmbrose_005_24.mp3 is ready for playing.")) ||
		(settings["harvestlordcat"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_002|WorldData|Sound/Dialogue/SeargeantMuldoon_002_14.mp3 is ready for playing.")) ||
		(settings["generalakillescat"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/Muldoon_005_07.mp3 is ready for playing.")) ||
		(settings["alicaneswiftarrowcat"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/SeargeantMuldoon_005_04.mp3 is ready for playing.")) ||
		(settings["gobblerkingcat"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue|WorldData|Sound/Dialogue/MerleAmbrose_QST_114.mp3 is ready for playing.")) ||
		(settings["diecat"] && vars.line.Contains("[STAT] CORE_SEER       GameClient::MSG_ZoneTransferRequest - Request to transfer to 'WizardCity/WC_Hub'.")) ||
		(settings["krakencat"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_002|WorldData|Sound/Dialogue/SohomerSunblade_002_18.mp3 is ready for playing.")) ||
		// Major Boss Splits
		// Rattlebones split is slightly inaccurate to UW% ending, Judd and Akilles splits are slightly weird
		(settings["rattlebonessplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_001|WorldData|Sound/Dialogue/CerenNightchant_001_22.mp3 is ready for playing.")) ||
		(settings["juddsplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_002|WorldData|Sound/Dialogue/SeargeantMuldoon_002_05.mp3 is ready for playing.")) ||
		(settings["gasplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/NolanStormgate_005_21.mp3 is ready for playing.")) ||
		(settings["hlsplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_002|WorldData|Sound/Dialogue/SuzieGryphonbane_002_07.mp3 is ready for playing.")) ||
		(settings["bgsplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/GrettaDarkkettle_005_22.mp3 is ready for playing.")) ||
		(settings["assplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/GrettaDarkkettle_005_35.mp3 is ready for playing.")) ||
		(settings["foulgazesplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/DaisyWillowmancer_005_02.mp3 is ready for playing.")) ||
		(settings["lnsplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/DaisyWillowmancer_005_09.mp3 is ready for playing.")) ||
		(settings["princesplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue|WorldData|Sound/Dialogue/MindyPixiecrown_QST_35.mp3 is ready for playing.")) ||
		(settings["baronsplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue|WorldData|Sound/Dialogue/MindyPixiecrown_QST_46.mp3 is ready for playing.")) ||
		// UW Misc
		(settings["soulsplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_001|WorldData|Sound/Dialogue/CerenNightchant_001_02.mp3 is ready for playing.")) ||
		(settings["piratesplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_001|WorldData|Sound/Dialogue/CerenNightchant_001_12.mp3 is ready for playing.")) ||
		(settings["fairysplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_001|WorldData|Sound/Dialogue/LadyOriel_001_11.mp3 is ready for playing.")) ||
		// CL Misc
		(settings["trollsplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/NolanStormgate_005_10.mp3 is ready for playing.")) ||
		(settings["cyrussplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/NolanStormgate_005_17.mp3 is ready for playing.")) ||
		(settings["bubblesplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/ElectraStormcloud_005_05.mp3 is ready for playing.")) ||
		(settings["warhornsplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/Romulus_005_02.mp3 is ready for playing.")) ||
		// TA Misc
		(settings["minionsplit1"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_002|WorldData|Sound/Dialogue/ArturGryphonbane_002_09.mp3 is ready for playing.")) ||
		(settings["eelsplit1"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_002|WorldData|Sound/Dialogue/DuncanGrimwater_002_08.mp3 is ready for playing.")) ||
		(settings["foddersplit1"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_002|WorldData|Sound/Dialogue/DuncanGrimwater_002_14.mp3 is ready for playing.")) ||
		(settings["screamersplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_002|WorldData|Sound/Dialogue/BladRaveneye_002_10.mp3 is ready for playing.")) ||
		// FA Misc
		(settings["minionsplit2"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/PrivateQuinn_005_06.mp3 is ready for playing.")) ||
		(settings["elfhuntersplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/LizzoFireSpitter_005_06.mp3 is ready for playing.")) ||
		(settings["magmamansplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/GrettaDarkkettle_005_08.mp3 is ready for playing.")) ||
		// HC Misc
		(settings["fieldguardsplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/MerleAmbrose_005_18.mp3 is ready for playing.")) ||
		// CB Misc
		(settings["scavengersnowmensplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue|WorldData|Sound/Dialogue/MindyPixiecrown_QST_17.mp3 is ready for playing.")) ||
		(settings["scoutersplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue|WorldData|Sound/Dialogue/MindyPixiecrown_QST_30.mp3 is ready for playing.")) ||
		(settings["gorgergluttonmunchersplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue|WorldData|Sound/Dialogue/MindyPixiecrown_QST_39.mp3 is ready for playing.")) ||
		// Kraken Misc
		(settings["eelsplit2"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_002|WorldData|Sound/Dialogue/SohomerSunblade_002_07.mp3 is ready for playing.")) ||
		(settings["barrelsplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_002|WorldData|Sound/Dialogue/SohomerSunblade_002_12.mp3 is ready for playing.")) ||
		(settings["foddersplit2"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_002|WorldData|Sound/Dialogue/SohomerSunblade_002_16.mp3 is ready for playing."))
	);
}

isLoading {
	if (settings["loadtimeremoval"]) {
		if (
			vars.line.Contains("[DBGM] CORE_SEER       Transition windows has appeared") ||
			vars.line.Contains("[DBGM] CORE_SEER       GameClient closed application connection with state 0.") ||
			vars.line.Contains("[DBGM] CORE_SEER       GameClient::MSG_CharacterSelected: Error=0, PrepPhase=1")
		) {
			vars.loading = true;
			return true;
		}
		else if (
			vars.loading &&
			(
				vars.line.Contains("[ERRO] CLIENT           639613566 Failed to load gamebryo texture resource:") ||
				vars.line.Contains("[DBGL] LADDER          PvPClientManager::MSG_Ladder  ladder[") ||
				vars.line.Contains("[DBGM] CORE_SEER       LOGIN RESPONSE: Error=0") ||
				vars.line.Contains("[WARN] CORE_SEER       Window::LoadGUI() - Loaded GUI 'Tutorial.gui' with deprecated GUI/ prefix!")
			)
		) {
			vars.loading = false;
			return false;
		}
	}
	return vars.loading;
}

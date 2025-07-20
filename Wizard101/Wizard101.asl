state("WizardGraphicalClient") {}

startup {
	settings.Add("verselector", true, "Game version (Any change requires a restart of the game to fully take effect)");
	settings.Add("verstandalone", false, "Stand-alone", "verselector");
	settings.Add("versteam", false, "Steam", "verselector");
	settings.Add("starttimer", true, "Auto-Start timer");
	settings.Add("category", true, "Category (Select only one)");
	settings.Add("wizardcitycat", false, "Wizard City%", "category");
	settings.Add("harvestlordcat", false, "Harvest Lord%", "category");
	settings.Add("generalakillescat", false, "General Akilles%", "category");
	settings.Add("alicaneswiftarrowcat", false, "Alicane Swiftarrow%", "category");
	settings.Add("gobblerkingcat", false, "Gobbler King%", "category");
	settings.Add("categoryextensions", true, "Category Extensions", "category");
	settings.Add("diecat", false, "Die%", "categoryextensions");
	settings.Add("krakencat", false, "Kraken%", "categoryextensions");
	settings.Add("ladyblackhopecat", false, "Lady Blackhope%", "categoryextensions");
	settings.Add("majorbosssplits", true, "Major Bosses");
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
	settings.Add("unicornwaymisc", true, "Unicorn Way");
	settings.Add("soulsplit", false, "Lost Souls", "unicornwaymisc");
	settings.Add("piratesplit", false, "Skeletal Pirates", "unicornwaymisc");
	settings.Add("fairysplit", false, "Dark Fairies", "unicornwaymisc");
	settings.Add("cyclopslanemisc", true, "Cyclops Lane");
	settings.Add("trollsplit", false, "Lumbering Trolls", "cyclopslanemisc");
	settings.Add("cyrussplit", false, "Cyrus' Laundry", "cyclopslanemisc");
	settings.Add("bubblesplit", false, "Bubbles", "cyclopslanemisc");
	settings.Add("warhornsplit", false, "Warhorns", "cyclopslanemisc");
	settings.Add("tritonavenuemisc", true, "Triton Avenue");
	settings.Add("minionsplit1", false, "Haunted Minions", "tritonavenuemisc");
	settings.Add("eelsplit1", false, "Electric Eel", "tritonavenuemisc");
	settings.Add("foddersplit1", false, "Rotting Fodders", "tritonavenuemisc");
	settings.Add("screamersplit", false, "Scarlet Screamers", "tritonavenuemisc");
	settings.Add("firecatalleymisc", true, "Firecat Alley");
	settings.Add("minionsplit2", false, "Haunted Minions", "firecatalleymisc");
	settings.Add("elfhuntersplit", false, "Fire Elf Hunters", "firecatalleymisc");
	settings.Add("magmamansplit", false, "Magma Men", "firecatalleymisc");
	settings.Add("hauntedcavemisc", true, "Haunted Cave");
	settings.Add("fieldguardsplit", false, "Field Guards", "hauntedcavemisc");
	settings.Add("colossusmisc", true, "Colossus Boulevard");
	settings.Add("scavengersnowmensplit", false, "Gobbler Scavengers/Evil Snowmen", "colossusmisc");
	settings.Add("scoutersplit", false, "Gobbler Scouters", "colossusmisc");
	settings.Add("gorgergluttonmunchersplit", false, "Gobbler Gorgers/Gluttons/Munchers", "colossusmisc");
	settings.Add("krakenmisc", true, "Kraken%");
	settings.Add("eelsplit2", false, "Electric Eels", "krakenmisc");
	settings.Add("barrelsplit", false, "Barrels", "krakenmisc");
	settings.Add("foddersplit2", false, "Rotting Fodder", "krakenmisc");
	settings.Add("experimentalfeatures", true, "Experimental Features (NOT RECOMMENDED FOR USE)");
	settings.Add("loadtimeremoval", false, "Load Time Removal", "experimentalfeatures");
}

init {
	var logPath = "";
	vars.loading = 0;
	vars.change_state_count = 0;
	vars.start_load_time = 0;
	vars.end_load_time = 0;
	vars.sigil_state = 0;
	vars.restore_gametime = 0;
	vars.game_load_time = 0;
	// TODO: Replace with a better path thing
	if (settings["verstandalone"] == true) {
		logPath = "C:\\ProgramData\\KingsIsle Entertainment\\Wizard101\\Bin\\WizardClient.log";
	}
	else if (settings["versteam"] == true) {
		logPath = "C:\\Program Files (x86)\\Steam\\steamapps\\common\\Wizard101\\Bin\\WizardClient.log";
	}
	if (File.Exists(logPath)) {
		try {
			FileStream fs = new FileStream(logPath, FileMode.Open, FileAccess.Write, FileShare.ReadWrite);
			fs.SetLength(0);
			fs.Close();
		}
		catch {}
		vars.reader = new StreamReader(new FileStream(logPath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite));
		print("Connected successfully");
	} 
	else {
		print("Couldn't find log file path");
		vars.reader = null;
		vars.line = null;
	}
}

update {
	while (vars.reader != null) {
		vars.line = vars.reader.ReadLine();
		if (vars.line == null) {
			return false;
		}
		else if (vars.line.Length < 18) {
			continue;
		}
		else if (vars.line.Substring(18, 6) == "[ERRO]") {
			continue;
		}
		break;
	}
	if (vars.line != null) {
		vars.line = vars.line.Substring(18);
		// Debugging line
		print("Line " + vars.line);
	}
}

start {
	vars.loading = 0;
	if (settings["starttimer"] == true) {
		if (vars.line == "[DBGM] CORE_SEER       GameClient::MSG_CharacterSelected: Error=0, PrepPhase=1") {
			return true;
		}
	}
	else {
		return false;
	}
}

split {
	if (settings["wizardcitycat"] == true) {
		// Not completely accurate, might touch up later
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/MerleAmbrose_005_24.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["harvestlordcat"] == true) {
		if (vars.line == "unfinished") {
			return true;
		}
	}
	if (settings["generalakillescat"] == true) {
		if (vars.line == "unfinished") {
			return true;
		}
	}
	if (settings["alicaneswiftarrowcat"] == true) {
		if (vars.line == "unfinished") {
			return true;
		}
	}
	if (settings["gobblerkingcat"] == true) {
		if (vars.line == "unfinished") {
			return true;
		}
	}
	if (settings["diecat"] == true) {
		if (vars.line == "[STAT] CORE_SEER       GameClient::MSG_ZoneTransferRequest - Request to transfer to 'WizardCity/WC_Hub'.") {
			return true;
		}
	}
	if (settings["krakencat"] == true) {
		if (vars.line == "unfinished") {
			return true;
		}
	}
	if (settings["ladyblackhopecat"] == true) {
		if (vars.line == "unfinished") {
			return true;
		}
	}
	if (settings["rattlebonessplit"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_001|WorldData|Sound/Dialogue/CerenNightchant_001_22.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["juddsplit"] == true) {
		if (vars.line == "unfinished") {
			return true;
		}
	}
	if (settings["gasplit"] == true) {
		// A bit weird, might touch up later
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/NolanStormgate_005_21.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["hlsplit"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_002|WorldData|Sound/Dialogue/ArturGryphonbane_002_19.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["bgsplit"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/GrettaDarkkettle_005_22.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["assplit"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/GrettaDarkkettle_005_35.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["foulgazesplit"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/DaisyWillowmancer_005_02.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["lnsplit"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/DaisyWillowmancer_005_09.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["princesplit"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue|WorldData|Sound/Dialogue/MindyPixiecrown_QST_35.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["baronsplit"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue|WorldData|Sound/Dialogue/MindyPixiecrown_QST_46.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["soulsplit"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_001|WorldData|Sound/Dialogue/CerenNightchant_001_02.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["piratesplit"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_001|WorldData|Sound/Dialogue/CerenNightchant_001_12.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["fairysplit"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_001|WorldData|Sound/Dialogue/LadyOriel_001_11.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["trollsplit"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/NolanStormgate_005_10.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["cyrussplit"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/NolanStormgate_005_17.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["bubblesplit"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/ElectraStormcloud_005_05.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["warhornsplit"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/Romulus_005_02.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["minionsplit1"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_002|WorldData|Sound/Dialogue/ArturGryphonbane_002_09.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["eelsplit1"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_002|WorldData|Sound/Dialogue/DuncanGrimwater_002_08.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["foddersplit1"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_002|WorldData|Sound/Dialogue/DuncanGrimwater_002_14.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["screamersplit"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_002|WorldData|Sound/Dialogue/BladRaveneye_002_10.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["minionsplit2"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/PrivateQuinn_005_06.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["elfhuntersplit"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/LizzoFireSpitter_005_06.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["magmamansplit"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/GrettaDarkkettle_005_08.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["fieldguardsplit"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/MerleAmbrose_005_18.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["scavengersnowmensplit"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue|WorldData|Sound/Dialogue/MindyPixiecrown_QST_17.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["scoutersplit"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue|WorldData|Sound/Dialogue/MindyPixiecrown_QST_30.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["gorgergluttonmunchersplit"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue|WorldData|Sound/Dialogue/MindyPixiecrown_QST_39.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["eelsplit2"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_002|WorldData|Sound/Dialogue/SohomerSunblade_002_07.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["barrelsplit"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_002|WorldData|Sound/Dialogue/SohomerSunblade_002_12.mp3 is ready for playing.") {
			return true;
		}
	}
	if (settings["foddersplit2"] == true) {
		if (vars.line == "[DBGL] SoundSystem     Sound stream |Sound_Dialogue_002|WorldData|Sound/Dialogue/SohomerSunblade_002_16.mp3 is ready for playing.") {
			return true;
		}
	}
}

isLoading {
	if (settings["loadtimeremoval"] == true) {
		if (vars.line == "[DBGM] CORE_SEER       Transition windows has appeared" || vars.line == "[DBGM] CORE_SEER       GameClient closed application connection with state 0.") {
			vars.loading = 1;
		}
		else if (vars.loading == 1 && (vars.line == "[DBGM] CORE_SEER       GameClient::MSG_LoginComplete has been exited.")) {
			vars.loading = 0;
		}
	}
	else {
		return false;
	}
	if (vars.loading == 1) {
		return true;
	}
	else {
		return false;
	}
}

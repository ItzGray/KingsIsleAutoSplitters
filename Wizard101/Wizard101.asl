state("WizardGraphicalClient") {}

startup {
	settings.Add("starttimer", true, "Auto-Start timer");
	settings.SetToolTip("starttimer", "Starts the timer automatically when selecting a character.");
	settings.Add("loadtimeremoval", true, "Load Time Removal");
	settings.SetToolTip("loadtimeremoval", "Enables Load Time Removal (Make sure to add a Game Time Timer to your layout!)");
	settings.Add("autosplitting", true, "Auto-Splitting");
	settings.SetToolTip("autosplitting", "Auto-Splitting settings");
	settings.Add("category", true, "Category Endings", "autosplitting");
	settings.SetToolTip("category", "Splits for category endings");
	settings.Add("wizardcitycat", false, "Wizard City%", "category");
	settings.SetToolTip("wizardcitycat", "Splits upon completion of the quest \"Take a Walk on the Nightside\"");
	settings.Add("harvestlordcat", false, "Harvest Lord%", "category");
	settings.SetToolTip("harvestlordcat", "Splits upon completion of the quest \"Triton Report\"");
	settings.Add("generalakillescat", false, "General Akilles%", "category");
	settings.SetToolTip("generalakillescat", "Splits upon completion of the quest \"Akilles' Deal\"");
	settings.Add("alicaneswiftarrowcat", false, "Alicane Swiftarrow%", "category");
	settings.SetToolTip("alicaneswiftarrowcat", "Splits upon completion of the quest \"Firecat's in the Bag\"");
	settings.Add("krokcat", false, "Krokotopia%", "category");
	settings.SetToolTip("krokcat", "Splits upon completion of the quest \"Triumphant Return!\"");
	settings.Add("gobblerkingcat", false, "Gobbler King%", "category");
	settings.SetToolTip("gobblerkingcat", "Splits upon completion of the quest \"New Neighbors?\"");
	settings.Add("categoryextensions", true, "Category Extensions", "category");
	settings.SetToolTip("categoryextensions", "Category ending splits for Category Extensions");
	settings.Add("diecat", false, "Die%", "categoryextensions");
	settings.SetToolTip("diecat", "Splits when a loading screen appears to take you to The Commons");
	settings.Add("krakencat", false, "Kraken%", "categoryextensions");
	settings.SetToolTip("krakencat", "Splits upon completion of the quest \"Decease the Kraken!\"");
	settings.Add("majorbosssplits", true, "Major Bosses", "autosplitting");
	settings.SetToolTip("majorbosssplits", "Splits for major bosses");
	settings.Add("rattlebonessplit", false, "Rattlebones", "majorbosssplits");
	settings.SetToolTip("rattlebonessplit", "Splits upon defeating Rattlebones during the quest \"Sinister Skeleton\"");
	settings.Add("juddsplit", false, "Old Judd", "majorbosssplits");
	settings.SetToolTip("juddsplit", "Splits upon completion of the quest \"Secret Strife of Pets\"");
	settings.Add("gasplit", false, "General Akilles", "majorbosssplits");
	settings.SetToolTip("gasplit", "Splits upon talking to Nolan Stormgate during the quest \"Akilles' Deal\"");
	settings.Add("hlsplit", false, "Harvest Lord", "majorbosssplits");
	settings.SetToolTip("hlsplit", "Splits upon completion of the quest \"The Enemy Revealed\"");
	settings.Add("bgsplit", false, "Bastilla Gravewynd", "majorbosssplits");
	settings.SetToolTip("bgsplit", "Splits upon completion of the quest \"100% Not That Witch\"");
	settings.Add("assplit", false, "Alicane Swiftarrow", "majorbosssplits");
	settings.SetToolTip("assplit", "Splits upon completion of the quest \"The Cure\"");
	settings.Add("foulgazesplit", false, "Foulgaze", "majorbosssplits");
	settings.SetToolTip("foulgazesplit", "Splits upon completion of the quest \"A Brief History of the Spiral\"");
	settings.Add("lnsplit", false, "Lord Nightshade", "majorbosssplits");
	settings.SetToolTip("lnsplit", "Splits upon completion of the quest \"Throwing Nightshade\"");
	settings.Add("bitisplit", false, "Biti Nirini", "majorbosssplits");
	settings.SetToolTip("bitisplit", "Splits upon completion of the quest \"The Final Rubbing\"");
	settings.Add("quartermastersplit", false, "Nirini Quartermaster", "majorbosssplits");
	settings.SetToolTip("quartermastersplit", "Splits upon completion of the quest \"Quarter Master\"");
	settings.Add("pofnirinisplit", false, "Palace of Fire Nirinis", "majorbosssplits");
	settings.SetToolTip("pofnirinisplit", "Splits upon completion of the quest \"Give 'Em Another Round\"");
	settings.Add("krokenkahmensplit", false, "Krokenkahmen", "majorbosssplits");
	settings.SetToolTip("krokenkahmensplit", "Splits upon completion of the quest \"Into the Map Room\"");
	settings.Add("odjisplit", false, "Odji Sokkwi", "majorbosssplits");
	settings.SetToolTip("odjisplit", "Splits upon completion of the quest \"Taking It to the Tuts\"");
	settings.Add("khaisplit", false, "Khai Amahte the Great", "majorbosssplits");
	settings.SetToolTip("khaisplit", "Splits upon completion of the quest \"The Ultimate Battle\"");
	settings.Add("vaultoficesplit", false, "Vault of Ice Guardians", "majorbosssplits");
	settings.SetToolTip("vaultoficesplit", "Splits upon completion of the quest \"Find the Fang\"");
	settings.Add("krokhotepsplit", false, "Krokhotep", "majorbosssplits");
	settings.SetToolTip("krokhotepsplit", "Splits upon completion of the quest \"Retribution\"");
	settings.Add("kingurosplit", false, "King Uro Ahnic", "majorbosssplits");
	settings.SetToolTip("kingurosplit", "Splits upon completion of the quest \"De-Cipher the Ahnics\"");
	settings.Add("kingshemetsplit", false, "King Shemet Djeserit", "majorbosssplits");
	settings.SetToolTip("kingshemetsplit", "Splits upon completion of the quest \"De-Cipher the Djeserits\"");
	settings.Add("karanahnpalacesplit", false, "Karanahn Palace Princes", "majorbosssplits");
	settings.SetToolTip("karanahnpalacesplit", "Splits upon completion of the quest \"The Key to the Temple\"");
	settings.Add("krokopatrasplit", false, "Krokopatra", "majorbosssplits");
	settings.SetToolTip("krokopatrasplit", "Splits upon completion of the quest \"Temple Dweller\"");
	settings.Add("princesplit", false, "Prince Gobblestone", "majorbosssplits");
	settings.SetToolTip("princesplit", "Splits upon completion of the quest \"Let's Make a Deal\"");
	settings.Add("baronsplit", false, "Barons Greebly and Rotunda", "majorbosssplits");
	settings.SetToolTip("baronsplit", "Splits upon completion of the quest \"Seal the Deal\"");
	settings.Add("unicornwaymisc", true, "Unicorn Way", "autosplitting");
	settings.SetToolTip("unicornwaymisc", "Unicorn Way miscellaneous splits");
	settings.Add("soulsplit", false, "Lost Souls", "unicornwaymisc");
	settings.SetToolTip("soulsplit", "Splits upon completion of the quest \"Ghost Hunters\"");
	settings.Add("piratesplit", false, "Skeletal Pirates", "unicornwaymisc");
	settings.SetToolTip("piratesplit", "Splits upon completion of the quest \"Skeleton Crew\"");
	settings.Add("fairysplit", false, "Dark Fairies", "unicornwaymisc");
	settings.SetToolTip("fairysplit", "Splits upon completion of the quest \"Finding Out Why\"");
	settings.Add("cyclopslanemisc", true, "Cyclops Lane", "autosplitting");
	settings.SetToolTip("cyclopslanemisc", "Cyclops Lane miscellaneous splits");
	settings.Add("trollsplit", false, "Lumbering Trolls", "cyclopslanemisc");
	settings.SetToolTip("trollsplit", "Splits upon completion of the quest \"A Stroll With Trolls\"");
	settings.Add("cyrussplit", false, "Cyrus' Laundry", "cyclopslanemisc");
	settings.SetToolTip("cyrussplit", "Splits upon completion of the quest \"Run and Done\"");
	settings.Add("bubblesplit", false, "Bubbles", "cyclopslanemisc");
	settings.SetToolTip("bubblesplit", "Splits upon completion of the quest \"The Cave Escape\"");
	settings.Add("warhornsplit", false, "Warhorns", "cyclopslanemisc");
	settings.SetToolTip("warhornsplit", "Splits upon completion of the quest \"Oh Me, Oh Minotaur\"");
	settings.Add("tritonavenuemisc", true, "Triton Avenue", "autosplitting");
	settings.SetToolTip("tritonavenuemisc", "Triton Avenue miscellaneous splits");
	settings.Add("minionsplit1", false, "Haunted Minions", "tritonavenuemisc");
	settings.SetToolTip("minionsplit1", "Splits upon completion of the quest \"Menacing Minions\"");
	settings.Add("eelsplit1", false, "Electric Eel", "tritonavenuemisc");
	settings.SetToolTip("eelsplit1", "Splits upon completion of the quest \"The Shadow of Death Magic\"");
	settings.Add("foddersplit1", false, "Rotting Fodders", "tritonavenuemisc");
	settings.SetToolTip("foddersplit1", "Splits upon completion of the quest \"Quest for Clues\"");
	settings.Add("screamersplit", false, "Scarlet Screamers", "tritonavenuemisc");
	settings.SetToolTip("screamersplit", "Splits upon completion of the quest \"Clear as Crystal\"");
	settings.Add("firecatalleymisc", true, "Firecat Alley", "autosplitting");
	settings.SetToolTip("firecatalleymisc", "Firecat Alley miscellaneous splits");
	settings.Add("minionsplit2", false, "Haunted Minions", "firecatalleymisc");
	settings.SetToolTip("minionsplit2", "Splits upon completion of the quest \"Putting Out the Fire!\"");
	settings.Add("elfhuntersplit", false, "Fire Elf Hunters", "firecatalleymisc");
	settings.SetToolTip("elfhuntersplit", "Splits upon completion of the quest \"She Ran Crying Wildfire\"");
	settings.Add("magmamansplit", false, "Magma Men", "firecatalleymisc");
	settings.SetToolTip("magmamansplit", "Splits upon completion of the quest \"Which Hunt?\"");
	settings.Add("hauntedcavemisc", true, "Haunted Cave", "autosplitting");
	settings.SetToolTip("hauntedcavemisc", "Haunted Cave miscellaneous splits");
	settings.Add("fieldguardsplit", false, "Field Guards", "hauntedcavemisc");
	settings.SetToolTip("fieldguardsplit", "Splits upon completion of the quest \"Things and Stuff\"");
	settings.Add("krokmisc", true, "Krokotopia%", "autosplitting");
	settings.SetToolTip("krokmisc", "Krokotopia% miscellaneous splits");
	settings.Add("chamberoffiresplit", false, "Chamber of Fire End", "krokmisc");
	settings.SetToolTip("chamberoffiresplit", "Splits upon completion of the quest \"Back to the Archeologist\"");
	settings.Add("pofmobssplit", false, "Palace of Fire Mobs", "krokmisc");
	settings.SetToolTip("pofmobssplit", "Splits upon completion of the quest \"Payback\"");
	settings.Add("palaceoffiresplit", false, "Palace of Fire End", "krokmisc");
	settings.SetToolTip("palaceoffiresplit", "Splits upon completion of the quest \"Back to Winthrop\"");
	settings.Add("nekhbetsplit", false, "Nekhbet", "krokmisc");
	settings.SetToolTip("nekhbetsplit", "Splits upon completion of the quest \"Search for the Seal\"");
	settings.Add("scavengersplit", false, "Soul Scavenger", "krokmisc");
	settings.SetToolTip("scavengersplit", "Splits upon completion of the quest \"Coin of Destiny\"");
	settings.Add("hallofchampionssplit", false, "Hall of Champions End", "krokmisc");
	settings.SetToolTip("hallofchampionssplit", "Splits upon completion of the quest \"Back Among the Fold\"");
	settings.Add("sunbirdsplit", false, "Wild Sunbird", "krokmisc");
	settings.SetToolTip("sunbirdsplit", "Splits upon completion of the quest \"Battle of the Sunbird\"");
	settings.Add("stonechinsplit", false, "Krag Stonechin", "krokmisc");
	settings.SetToolTip("stonechinsplit", "Splits upon completion of the quest \"Stonechin\"");
	settings.Add("malletmanesplit", false, "Bort Malletmane", "krokmisc");
	settings.SetToolTip("malletmanesplit", "Splits upon completion of the quest \"Malletmane\"");
	settings.Add("itennusplit", false, "Itennu Sokkwi", "krokmisc");
	settings.SetToolTip("itennusplit", "Splits upon completion of the quest \"Who's More Amazing?\"");
	settings.Add("grandarenasplit", false, "Grand Arena End", "krokmisc");
	settings.SetToolTip("grandarenasplit", "Splits upon completion of the quest \"Return to Shalek\"");
	settings.Add("colossusmisc", true, "Colossus Boulevard", "autosplitting");
	settings.SetToolTip("colossusmisc", "Colossus Boulevard miscellaneous splits");
	settings.Add("scavengersnowmensplit", false, "Gobbler Scavengers/Evil Snowmen", "colossusmisc");
	settings.SetToolTip("scavengersnowmensplit", "Splits upon completion of the quest \"Invasion\"");
	settings.Add("scoutersplit", false, "Gobbler Scouters", "colossusmisc");
	settings.SetToolTip("scoutersplit", "Splits upon completion of the quest \"Doctor's Orders\"");
	settings.Add("gorgergluttonmunchersplit", false, "Gobbler Gorgers/Gluttons/Munchers", "colossusmisc");
	settings.SetToolTip("gorgergluttonmunchersplit", "Splits upon completion of the quest \"A Foul Decree\"");
	settings.Add("krakenmisc", true, "Kraken%", "autosplitting");
	settings.SetToolTip("krakenmisc", "Kraken% miscellaneous splits");
	settings.Add("eelsplit2", false, "Electric Eels", "krakenmisc");
	settings.SetToolTip("eelsplit2", "Splits upon completion of the quest \"All the Eels\"");
	settings.Add("barrelsplit", false, "Barrels", "krakenmisc");
	settings.SetToolTip("barrelsplit", "Splits upon completion of the quest \"Wayward Barrels\"");
	settings.Add("foddersplit2", false, "Rotting Fodder", "krakenmisc");
	settings.SetToolTip("foddersplit2", "Splits upon completion of the quest \"Better Get Kraken\"");
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
		(settings["krokcat"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_KT|WorldData|Sound/Dialogue/SergeantMajorTalbot_QST_21.mp3 is ready for playing.")) ||
		(settings["gobblerkingcat"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue|WorldData|Sound/Dialogue/MerleAmbrose_QST_114.mp3 is ready for playing.")) ||
		(settings["diecat"] && vars.line.Contains("[STAT] CORE_SEER       GameClient::MSG_ZoneTransferRequest - Request to transfer to 'WizardCity/WC_Hub'.")) ||
		(settings["krakencat"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_002|WorldData|Sound/Dialogue/SohomerSunblade_002_18.mp3 is ready for playing.")) ||
		// Major Boss Splits
		// Rattlebones split is slightly inaccurate to UW% ending, Judd and Akilles splits are slightly weird
		(settings["rattlebonessplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_001|WorldData|Sound/Dialogue/Rattlebones_001_02.mp3 is ready for playing.")) ||
		(settings["juddsplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_002|WorldData|Sound/Dialogue/SeargeantMuldoon_002_05.mp3 is ready for playing.")) ||
		(settings["gasplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/NolanStormgate_005_21.mp3 is ready for playing.")) ||
		(settings["hlsplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_002|WorldData|Sound/Dialogue/SuzieGryphonbane_002_07.mp3 is ready for playing.")) ||
		(settings["bgsplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/GrettaDarkkettle_005_22.mp3 is ready for playing.")) ||
		(settings["assplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/GrettaDarkkettle_005_35.mp3 is ready for playing.")) ||
		(settings["foulgazesplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/DaisyWillowmancer_005_02.mp3 is ready for playing.")) ||
		(settings["lnsplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_005|WorldData|Sound/Dialogue/DaisyWillowmancer_005_09.mp3 is ready for playing.")) ||
		(settings["bitisplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Krokotopia|WorldData|Sound/Dialogue/ProfWinthrop_QST_31.mp3 is ready for playing.")) ||
		(settings["quartermastersplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Krokotopia|WorldData|Sound/Dialogue/AssistantDanforth_QST_23.mp3 is ready for playing.")) ||
		(settings["pofnirinisplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_KT|WorldData|Sound/Dialogue/LieutenantStandish_QST_23.mp3 is ready for playing.")) ||
		(settings["krokenkahmensplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_KT|WorldData|Sound/Dialogue/ProfWinthrop_QST_42.mp3 is ready for playing.")) ||
		(settings["odjisplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_KT|WorldData|Sound/Dialogue/GeneralKhaba_QST_17.mp3 is ready for playing.")) ||
		(settings["khaisplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_KT|WorldData|Sound/Dialogue/Narrator_NAR_199.mp3 is ready for playing.")) ||
		(settings["vaultoficesplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_KT|WorldData|Sound/Dialogue/ShalekTheWise_QST_25.mp3 is ready for playing.")) ||
		(settings["krokhotepsplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_KT|WorldData|Sound/Dialogue/ShalekTheWise_QST_33.mp3 is ready for playing.")) ||
		(settings["kingurosplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_KT|WorldData|Sound/Dialogue/GhostOfKrokhotep_QST_08.mp3 is ready for playing.")) ||
		(settings["kingshemetsplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_KT|WorldData|Sound/Dialogue/GhostOfKrokhotep_QST_13.mp3 is ready for playing.")) ||
		(settings["karanahnpalacesplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_KT|WorldData|Sound/Dialogue/GhostOfKrokhotep_QST_20.mp3 is ready for playing.")) ||
		(settings["krokopatrasplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_KT|WorldData|Sound/Dialogue/GhostOfKrokhotep_QST_26.mp3 is ready for playing.")) ||
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
		// Krok Misc
		(settings["chamberoffiresplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_KT|WorldData|Sound/Dialogue/ProfWinthrop_QST_45.mp3 is ready for playing.")) ||
		(settings["pofmobssplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_KT|WorldData|Sound/Dialogue/LieutenantStandish_QST_16.mp3 is ready for playing.")) ||
		(settings["palaceoffiresplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_KT|WorldData|Sound/Dialogue/ProfWinthrop_QST_37.mp3 is ready for playing.")) ||
		(settings["nekhbetsplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_KT|WorldData|Sound/Dialogue/Rami_QST_11.mp3 is ready for playing.")) ||
		(settings["scavengersplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_KT|WorldData|Sound/Dialogue/GeneralKhaba_QST_13.mp3 is ready for playing.")) ||
		(settings["hallofchampionssplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_KT|WorldData|Sound/Dialogue/ShalekTheWise_QST_14.mp3 is ready for playing.")) ||
		(settings["sunbirdsplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_KT|WorldData|Sound/Dialogue/ArenaMaster_QST_27.mp3 is ready for playing.")) ||
		(settings["stonechinsplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_KT|WorldData|Sound/Dialogue/ArenaMaster_QST_31.mp3 is ready for playing.")) ||
		(settings["malletmanesplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_KT|WorldData|Sound/Dialogue/ArenaMaster_QST_35.mp3 is ready for playing.")) ||
		(settings["itennusplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_KT|WorldData|Sound/Dialogue/ArenaMaster_QST_20.mp3 is ready for playing.")) ||
		(settings["grandarenasplit"] && vars.line.Contains("[DBGL] SoundSystem     Sound stream |Sound_Dialogue_KT|WorldData|Sound/Dialogue/ShalekTheWise_QST_19.mp3 is ready for playing.")) ||
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
	if (
		vars.line.Contains("[DBGM] CORE_SEER       Transition windows has appeared") ||
		vars.line.Contains("[DBGM] CORE_SEER       GameClient closed application connection with state 0.") ||
		vars.line.Contains("[DBGM] CORE_SEER       GameClient::MSG_CharacterSelected: Error=0, PrepPhase=1")
	) {
		vars.loading = true;
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
	}
	return (settings["loadtimeremoval"] && vars.loading);
}

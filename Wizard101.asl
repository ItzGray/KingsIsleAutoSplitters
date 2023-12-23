state("WizardGraphicalClient") {}

startup {
	settings.Add("verselector", true, "Version (Any change requires a restart of LiveSplit to fully take effect)");
	settings.Add("verstandalone", true, "Stand-alone", "verselector");
	settings.Add("versteam", false, "Steam", "verselector");
	settings.Add("starttimer", true, "Auto-Start timer");
	settings.Add("category", true, "Category (Select only one)");
	settings.Add("harvestlordcat", false, "Harvest Lord%", "category");
	settings.Add("generalakillescat", false, "General Akilles%", "category");
	settings.Add("alicaneswiftarrowcat", false, "Alicane Swiftarrow%", "category");
	settings.Add("wizardcitycat", false, "Wizard City%", "category");
	settings.Add("gobblerkingcat", false, "Gobbler King%", "category");
	settings.Add("categoryextensions", true, "Category Extensions", "category");
	settings.Add("diecat", false, "Die%", "categoryextensions");
	settings.Add("krakencat", false, "Kraken%", "categoryextensions");
	settings.Add("ladyblackhopecat", false, "Lady Blackhope%", "categoryextensions");
	settings.Add("golemcourtcat", false, "Golem Court%", "categoryextensions");
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
	settings.Add("otherstuff", true, "Important Other Stuff");
	settings.Add("streetorder", true, "Street Order (relevant for Wizard City% and Gobbler King%)", "otherstuff");
	settings.Add("cltafa", false, "Cyclops Lane-Triton Avenue-Firecat Alley", "streetorder");
	settings.Add("taclfa", false, "Triton Avenue-Cyclops Lane-Firecat Alley", "streetorder");
	settings.Add("akillesskip", false, "Are you doing Akilles Skip? (relevant for Wizard City%)", "otherstuff");
	settings.Add("juddskip", false, "Are you doing Judd Skip? (relevant for Kraken%)", "otherstuff");
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
	settings.Add("magmamansplit", false, "Fire Elf Pahtfinders/Magma Men", "firecatalleymisc");
	settings.Add("hauntedcavemisc", true, "Haunted Cave");
	settings.Add("fieldguardsplit", false, "Field Guards", "hauntedcavemisc");
	settings.Add("colossusmisc", true, "Colossus Boulevard");
	settings.Add("scavengersnowmen", false, "Gobbler Scavengers/Evil Snowmen", "colossusmisc");
	settings.Add("scoutersplit", false, "Gobbler Scouters", "colossusmisc");
	settings.Add("gorgergluttonmuncher", false, "Gobbler Gorgers/Gluttons/Munchers", "colossusmisc");
	settings.Add("golemcourtmisc", true, "Golem Tower");
	settings.Add("floor1split", false, "Floor 1", "golemcourtmisc");
	settings.Add("floor2split", false, "Floor 2", "golemcourtmisc");
	settings.Add("floor3split", false, "Floor 3", "golemcourtmisc");
	settings.Add("floor4split", false, "Floor 4", "golemcourtmisc");
	settings.Add("krakenmisc", true, "Kraken%");
	settings.Add("eelsplit2", false, "Electric Eels", "krakenmisc");
	settings.Add("barrelsplit", false, "Barrels", "krakenmisc");
	settings.Add("foddersplit3", false, "Rotting Fodder", "krakenmisc");
}

init {
	var logPath = "";
	vars.questsCompleted = 0;
	vars.battlesCompleted = 0;
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
	} 
	else {
		vars.reader = null;
		vars.line = null;
	}
}

update {
	while (vars.reader != null) {
		vars.line = vars.reader.ReadLine();
		if (vars.line == null || vars.line.Length < 18) {
			return false;
		}
		if (vars.line.Substring(18, 6) == "[DBGL]" || vars.line.Substring(18, 6) == "[WARN]" || vars.line.Substring(18, 6) == "[ERRO]") {
			continue;
		}
		else if (vars.line.Substring(25, 16) != "CORE_SEER       " && vars.line.Substring(25, 16) != "QuestHelper     ") {
			continue;
		}
		break;
	}
	if (vars.line != null) {
		vars.line = vars.line.Substring(18);
	}
	if (vars.questsCompleted % 2 != 0 && vars.questsCompleted * -1 < 0) {
		vars.questsCompleted = vars.questsCompleted * -1;
	}
	else if (vars.questsCompleted % 2 == 0 && vars.questsCompleted * -1 > 0) {
		vars.questsCompleted = vars.questsCompleted * -1;
	}
	if (vars.line == "[STAT] QuestHelper     WizardQuestClientManager::SetActiveQuest() - Setting active quest to 0 and saving to registry file") {
		if (vars.questsCompleted * -1 > 0) {
			vars.questsCompleted = vars.questsCompleted - 2;
		}
		vars.questsCompleted = vars.questsCompleted + 1;
	}
	if (settings["golemcourtcat"] == true) {
		if (vars.line.Substring(0, 73) == "[DBGM] CORE_SEER       MSG_EndDuel received for duel that does not exist:") {
			vars.battlesCompleted = vars.battlesCompleted + 1;
		}
	}
}

start {
	vars.questsCompleted = 0;
	vars.battlesCompleted = 0;
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
	if (settings["harvestlordcat"] == true) {
		if (vars.questsCompleted == 21) {
			return true;
		}
	}
	if (settings["generalakillescat"] == true) {
		if (vars.questsCompleted == 17) {
			return true;
		}
	}
	if (settings["alicaneswiftarrowcat"] == true) {
		if (vars.questsCompleted == 19) {
			return true;
		}
	}
	if (settings["wizardcitycat"] == true) {
		if (vars.questsCompleted == -38) {
			return true;
		}
	}
	if (settings["gobblerkingcat"] == true) {
		if (vars.questsCompleted == 43) {
			return true;
		}
	}
	if (settings["diecat"] == true) {
		if (vars.line == "[STAT] CORE_SEER       GameClient::MSG_ZoneTransferRequest - Request to transfer to 'WizardCity/WC_Hub'.") {
			return true;
		}
	}
	if (settings["krakencat"] == true) {
		if (vars.questsCompleted == 15) {
			return true;
		}
	}
	if (settings["ladyblackhopecat"] == true) {
		if (vars.questsCompleted == -4) {
			return true;
		}
	}
	if (settings["golemcourtcat"] == true) {
		if (vars.battlesCompleted == 12) {
			return true;
		}
	}
	if (settings["rattlebonessplit"] == true) {
		if (vars.questsCompleted == 7) {
			return true;
		}
	}
	if (settings["juddskip"] == true) {
		if (vars.questsCompleted == 7) {
			vars.questsCompleted = vars.questsCompleted + 1;
		}
	}
	if (settings["juddsplit"] == true) {
		if (vars.questsCompleted == 11) {
			return true;
		}
	}
	if (settings["foulgazesplit"] == true) {
		if (vars.questsCompleted == 35) {
			return true;
		}
	}
	if (settings["lnsplit"] == true) {
		if (vars.questsCompleted == -36) {
			return true;
		}
	}
	if (settings["princesplit"] == true) {
		if (vars.questsCompleted == -40) {
			return true;
		}
	}
	if (settings["baronsplit"] == true) {
		if (vars.questsCompleted == -42) {
			return true;
		}
	}
	if (settings["soulsplit"] == true) {
		if (vars.questsCompleted == -2) {
			return true;
		}
	}
	if (settings["piratesplit"] == true) {
		if (vars.questsCompleted == 3) {
			return true;
		}
	}
	if (settings["fairysplit"] == true) {
		if (vars.questsCompleted == 5) {
			return true;
		}
	}
	if (settings["taclfa"] == true) {
		if (vars.questsCompleted * -1 < 0) {
			vars.questsCompleted = vars.questsCompleted - 10;
		}
		else {
			vars.questsCompleted = vars.questsCompleted + 10;
		}
	}
	if (settings["gasplit"] == true) {
		if (vars.questsCompleted == 17) {
			return true;
		}
	}
	if (settings["trollsplit"] == true) {
		if (vars.questsCompleted == 13) {
			return true;
		}
	}
	if (settings["cyrussplit"] == true) {
		if (vars.questsCompleted == -14) {
			return true;
		}
	}
	if (settings["bubblesplit"] == true) {
		if (vars.questsCompleted == 15) {
			return true;
		}
	}
	if (settings["warhornsplit"] == true) {
		if (vars.questsCompleted == -16) {
			if (settings["akillesskip"] == true && settings["generalakillescat"] == false) {
				vars.questsCompleted = vars.questsCompleted + 1;
			}
			return true;
		}
	}
	if (settings["taclfa"] == true) {
		if (vars.questsCompleted * -1 < 0) {
			vars.questsCompleted = vars.questsCompleted + 10;
		}
		else {
			vars.questsCompleted = vars.questsCompleted - 10;
		}
	}
	else if (settings["cltafa"] == true) {
		if (vars.questsCompleted * -1 < 0) {
			vars.questsCompleted = vars.questsCompleted - 6;
		}
		else {
			vars.questsCompleted = vars.questsCompleted + 6;
		}
	}
	if (settings["hlsplit"] == true) {
		if (vars.questsCompleted == 19) {
			return true;
		}
	}
	if (settings["minionsplit1"] == true) {
		if (vars.questsCompleted == 13) {
			return true;
		}
	}
	if (settings["eelsplit1"] == true) {
		if (vars.questsCompleted == -14) {
			return true;
		}
	}
	if (settings["foddersplit1"] == true) {
		if (vars.questsCompleted == 15) {
			return true;
		}
	}
	if (settings["screamersplit"] == true) {
		if (vars.questsCompleted == 17) {
			return true;
		}
	}
	if (settings["cltafa"] == true) {
		if (vars.questsCompleted * -1 < 0) {
			vars.questsCompleted = vars.questsCompleted + 6;
		}
		else {
			vars.questsCompleted = vars.questsCompleted - 6;
		}
	}
	if (settings["bgsplit"] == true) {
		if (vars.questsCompleted == 15 || vars.questsCompleted == 31) {
			return true;
		}
	}
	if (settings["assplit"] == true) {
		if (vars.questsCompleted == 17 || vars.questsCompleted == 33) {
			return true;
		}
	}
	if (settings["minionsplit2"] == true) {
		if (vars.questsCompleted == -12 || vars.questsCompleted == -28) {
			return true;
		}
	}
	if (settings["elfhuntersplit"] == true) {
		if (vars.questsCompleted == 13 || vars.questsCompleted == 29) {
			return true;
		}
	}
	if (settings["magmamansplit"] == true) {
		if (vars.questsCompleted == -14 || vars.questsCompleted == -30) {
			return true;
		}
	}
	if (settings["fieldguardsplit"] == true) {
		if (vars.questsCompleted == 37) {
			return true;
		}
	}
	if (settings["scavengersnowmen"] == true) {
		if (vars.questsCompleted == 37) {
			return true;
		}
	}
	if (settings["scoutersplit"] == true) {
		if (vars.questsCompleted == 39) {
			return true;
		}
	}
	if (settings["gorgergluttonmuncher"] == true) {
		if (vars.questsCompleted == 41) {
			return true;
		}
	}
	if (settings["floor1split"] == true) {
		if (vars.line == "[STAT] CORE_SEER       GameClient::MSG_ZoneTransferRequest - Request to transfer to 'WizardCity/WC_Streets/WC_Golem_Tower/WC_Golem_Tower_2'.") {
			return true;
		}
	}
	if (settings["floor2split"] == true) {
		if (vars.line == "[STAT] CORE_SEER       GameClient::MSG_ZoneTransferRequest - Request to transfer to 'WizardCity/WC_Streets/WC_Golem_Tower/WC_Golem_Tower_3'.") {
			return true;
		}
	}
	if (settings["floor3split"] == true) {
		if (vars.line == "[STAT] CORE_SEER       GameClient::MSG_ZoneTransferRequest - Request to transfer to 'WizardCity/WC_Streets/WC_Golem_Tower/WC_Golem_Tower_4'.") {
			return true;
		}
	}
	if (settings["floor4split"] == true) {
		if (vars.line == "[STAT] CORE_SEER       GameClient::MSG_ZoneTransferRequest - Request to transfer to 'WizardCity/WC_Streets/WC_Golem_Tower/WC_Golem_Tower_5'.") {
			return true;
		}
	}
	if (settings["eelsplit2"] == true) {
		if (vars.questsCompleted == -12) {
			return true;
		}
	}
	if (settings["barrelsplit"] == true) {
		if (vars.questsCompleted == 13) {
			return true;
		}
	}
	if (settings["foddersplit3"] == true) {
		if (vars.questsCompleted == -14) {
			return true;
		}
	}
}

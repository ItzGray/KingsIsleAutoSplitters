state("WizardGraphicalClient") {}

startup {
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
	vars.expGainedNum = 0;
	vars.expGained = 0;
	vars.expDupe = 0;
	vars.battlesCompleted = 0;
	// Standard output reading code goes here
}

update {
	while (vars.reader != null) {
		vars.line = vars.reader.ReadLine();
		// Filter code goes here
	}
	if (vars.line != null) {
		// Filter code goes here
	}
	if (vars.line.Substring(0, 3) == "---" && vars.expGained != 2) {
		if (vars.line.Substring(6, 1) == "e") {
			vars.expGainedNum = vars.line.Substring(4, 1);
		}
		else if (vars.line.Substring(6, 1) == " ") {
			vars.expGainedNum = vars.line.Substring(4, 2);
		}
		else {
			vars.expGainedNum = vars.line.Substring(4, 3);
		}
		vars.expGained = 1;
		vars.expGainedNum = Int32.Parse(vars.expGainedNum);
	}
	if (vars.expGained == 1 && vars.line.Substring(0, 87) == "[STAT] WizardQuestClientManager::OnSendQuest() - Setting active quest since it is new: ") {
		vars.expGained = 2;
	}
	if (vars.expGained == 2) {
		if (vars.expGainedNum == 45 || vars.expGainedNum == 95 || vars.expGainedNum == 110 || vars.expGainedNum == 150 || vars.expGainedNum == 15 || vars.expGainedNum == 155 || vars.expGainedNum == 220 || vars.expGainedNum == 230 || vars.expGainedNum == 55 || vars.expGainedNum == 250 || vars.expGainedNum == 275 || vars.expGainedNum == 355) {
			vars.expDupe = vars.expDupe + 1;
		}
	}
	if (settings["golemcourtcat"] == true) {
		if (vars.line.Substring(0, 57) == "[DBGM] MSG_EndDuel received for duel that does not exist:") {
			vars.battlesCompleted = vars.battlesCompleted + 1;
		}
	}
}

start {
	vars.expGained = 0;
	vars.expGainedNum = 0;
	vars.expDupe = 0;
	vars.battlesCompleted = 0;
	if (settings["starttimer"] == true) {
		if (vars.line == "[DBGM] GameClient::MSG_CharacterSelected: Error=0, PrepPhase=1") {
			return true;
		}
	}
	else {
		return false;
	}
}

split {
	if (settings["harvestlordcat"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 55 && vars.expDupe == 11) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["generalakillescat"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 220) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["alicaneswiftarrowcat"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 25) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["wizardcitycat"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 320) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["gobblerkingcat"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 355 && vars.expDupe == 25) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["diecat"] == true) {
		if (vars.line == "[STAT] GameClient::MSG_ZoneTransferRequest - Request to transfer to 'WizardCity/WC_Hub'.") {
			return true;
		}
	}
	if (settings["krakencat"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 205) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["ladyblackhopecat"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 60) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["golemcourtcat"] == true) {
		if (vars.battlesCompleted == 12) {
			return true;
		}
	}
	if (settings["rattlebonessplit"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 110 && vars.expDupe == 5) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["juddsplit"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 8) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["foulgazesplit"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 250 && vars.expDupe == 22) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["lnsplit"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 275 && vars.expDupe == 23) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["princesplit"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 275 && vars.expDupe == 23) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["baronsplit"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 355 && vars.expDupe == 24) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["soulsplit"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 45 && vars.expDupe == 1) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["piratesplit"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 95 && vars.expDupe == 2) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["fairysplit"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 120) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["gasplit"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 220 && (vars.expDupe == 11 || vars.expDupe == 16)) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["trollsplit"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 155 && (vars.expDupe == 8 || vars.expDupe == 13)) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["cyrussplit"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 110 && (vars.expDupe == 9 || vars.expDupe == 14)) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["bubblesplit"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 210) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["warhornsplit"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 155 && (vars.expDupe == 10 || vars.expDupe == 15)) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["hlsplit"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 195) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["minionsplit1"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 235) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["eelsplit1"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 240) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["foddersplit1"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 230 && (vars.expDupe == 8 || vars.expDupe == 13)) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["screamersplit"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 190) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["bgsplit"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 230 && vars.expDupe == 19) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["assplit"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 250 && vars.expDupe == 21) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["minionsplit2"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 15 && vars.expDupe == 17) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["elfhuntersplit"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 105) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["magmamansplit"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 150 && vars.expDupe == 18) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["fieldguardsplit"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 150 && vars.expDupe == 24) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["scavengersnowmen"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 185) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["scoutersplit"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 220 && vars.expDupe == 22) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["gorgergluttonmuncher"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 255) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["floor1split"] == true) {
		if (vars.battlesCompleted == 8) {
			return true;
		}
	}
	if (settings["floor2split"] == true) {
		if (vars.battlesCompleted == 9) {
			return true;
		}
	}
	if (settings["floor3split"] == true) {
		if (vars.battlesCompleted == 10) {
			return true;
		}
	}
	if (settings["floor4split"] == true) {
		if (vars.battlesCompleted == 11) {
			return true;
		}
	}
	if (settings["eelsplit2"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 75) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["barrelsplit"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 50) {
			vars.expGained = 0;
			return true;
		}
	}
	if (settings["foddersplit3"] == true) {
		if (vars.expGained == 2 && vars.expGainedNum == 95 && vars.expDupe == 7) {
			vars.expGained = 0;
			return true;
		}
	}
}

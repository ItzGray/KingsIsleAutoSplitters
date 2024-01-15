state("Pirate") {}

startup {
	settings.Add("verselector", true, "Version (Any change requires a restart of LiveSplit to fully take effect)");
	settings.Add("verstandalone", true, "Stand-alone", "verselector");
	settings.Add("versteam", false, "Steam", "verselector");
	settings.Add("starttimer", true, "Auto-Start timer");
	settings.Add("category", true, "Category (Select only one)");
}

init {
	var logPath = "";
	vars.questsCompleted = 0;
	vars.battlesCompleted = 0;
	if (settings["verstandalone"] == true) {
		logPath = "C:\\ProgramData\\KingsIsle Entertainment\\Pirate101\\Bin\\Logs\\Captains.log";
	}
	else if (settings["versteam"] == true) {
		logPath = "C:\\Program Files (x86)\\Steam\\steamapps\\common\\Pirate101\\Bin\\Logs\\Captains.log";
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
}

start {
	vars.questsCompleted = 0;
	if (settings["starttimer"] == true) {
		if (vars.line == "[STAT] Tutorial        ClientTutorial.cpp   0130 [0] Posting server event: "Event_Tutorial_Brig_SkipTutorial"") {
			return true;
		}
	}
	else {
		return false;
	}
}

split {

}

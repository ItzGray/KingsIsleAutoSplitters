state("Pirate") {}

startup {
	settings.Add("starttimer", true, "Auto-Start timer");
	settings.Add("category", true, "Category (Select only one)");
}

init {
	var logPath = "";
	var firstModule = modules.First();
	var gameDir = Path.GetDirectoryName(firstModule.FileName);
	logPath = gameDir.ToString() + "\\Logs\\Captains.log";
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
		if (vars.line == null) {
			return false;
		}
		try {
			vars.line = vars.line.Substring(18);
		}
		catch {
			return false;
		}
		var lineStart = vars.line.Substring(0, 6);
		if (lineStart == "[DBGL]" || lineStart == "[WARN]" || lineStart == "[ERRO]") {
			return false;
		}
		break;
	}
	// Debugging line
	print("Line " + vars.line);
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

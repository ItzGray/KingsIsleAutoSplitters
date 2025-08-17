state("Pirate") {}

startup {
	settings.Add("starttimer", true, "Auto-Start timer");
	settings.Add("loadtimeremoval", true, "Load Time Removal");
}

init {
	vars.loading = false;
	var logPath = Path.GetDirectoryName(modules.First().FileName).ToString() + "\\Logs\\Captains.log";
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
		if (vars.line.Contains("[STAT] Tutorial        ClientTutorial.cpp   0130 [0] Posting server event: \"Event_Tutorial_Brig_SkipTutorial\"")) {
			return true;
		}
	}
}

isLoading {
	if (
		vars.line.Contains("[STAT] GAME_CLIENT     GameClient.cpp       4211 [") ||
		vars.line.Contains("[DBGM] CORE_SEER       GameClient.cpp       3673 [0] GameClient closed application connection with state 0.") ||
		vars.line.Contains("[STAT] ConnectionTimer GameClient.cpp       0209 [0] ZoneServer Connection Timer Initialized")
	) {
		vars.loading = true;
	}
	else if (
		vars.line.Contains("[STAT] ResourceManager ResourceManager.cpp  1033 [0] Zone load time ") ||
		vars.line.Contains("[DBGM] CORE_SEER       GameClient.cpp       2422 [0] LOGIN RESPONSE: Error=0")
	) {
		vars.loading = false;
	}
	return (settings["loadtimeremoval"] && vars.loading);
}
# Powershell Godot Launcher
This project uses two scripts to automatically detect and run the right Godot version for a `godot.project` file. It ONLY looks at major/minor version because that's all that the `project.godot` file stores.

Instructions:
* Download both files.
* Run `register-godot-launcher.ps1`. It will request admin privileges to register the .godot extension with powershell
* Create shortcuts for each major/minor version pair and *put them next to the two powershell scripts*
  * IE, if you have `Godot_v4.2.2-stable_win64.exe`, create a shortcut for it named `4.2`
* Double click on a `godot.project` file, it should now launch the proper version of Godot!

Notes:
* If you ever move the powershell scripts you'll need to move the shortcuts too and re-run `register-godot-launcher.ps` as well
* I could implement version locking, ask or send me a PR 🙃

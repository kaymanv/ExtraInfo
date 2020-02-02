
try(DestroyDialog EIinstaller_RO)catch()

rollout EIinstaller_RO "Extra Info Installer" Width:350 height:200
(
	group "INFO"
	(
		label lbl_Info "Hello! thanks for downloading my script." align:#left
		label lbl_Info2 "For more info you can go to: " align:#left
		HyperLink hl_github "Github" address:"https://github.com/kaymanv/ExtraInfo" color:(color 190 190 255) visitedColor:(color 128 128 255)
		HyperLink hl_artstation "Artstation" address:"https://www.artstation.com/artwork/GXREPz" color:(color 190 190 255) visitedColor:(color 128 128 255)
		label lbl_Info3 "If you wish to contact me, you can email me at: " align:#left
		HyperLink hl_email "Email" address:"volbedakay@gmail.com" color:(color 190 190 255) visitedColor:(color 128 128 255)
		
	)
	button btn_install " Install Extra Info " width:155 height:35 align:#left across:2
	button btn_uninstall " Uninstall Extra Info " width:155 height:35 align:#right
	--button btn_download " Download newer version "width: 250 height:20 align:#left offset:[-8,0]
	
	fn RemoveFiles =
	(
		hiddenDOSCommand ("rmdir /s /q \"" + ((getDir #userscripts) + @"\ExtraInfo\") + "\"")
		hiddenDOSCommand ("del \"" +(( getdir #usericons ) + @"\ExtraInfoLogo_16i.bmp") + "\"")
		hiddenDOSCommand ("del \"" +(( getdir #usericons ) + @"\ExtraInfoLogo_16a.bmp") + "\"")
		hiddenDOSCommand ("del \"" +(( getdir #usericons ) + @"\ExtraInfoLogo_24a.bmp") + "\"")
		hiddenDOSCommand ("del \"" +(( getdir #usericons ) + @"\ExtraInfoLogo_24i.bmp") + "\"")
		hiddenDOSCommand ("del \"" +(( getdir #usericons ) + @"\ExtraInfoLogo_16i.bmp") + "\"")
	)
	
	fn InstallFiles =
	(
		tempDir = ((getdir #temp) + @"\" + "ExtraInfo" + @"\" )
		
		copyScriptsFolder = ("xcopy " + "\"" + tempDir + "Scripts" + "\"" + " " + "\"" + (getDir #userscripts) + @"\" /*+  "\"" */  + " /E")
		copyIconsFolder = ("xcopy " + "\"" + tempDir + @"UI_ln\Icons" + "\"" + " " + "\"" + (getDir #usericons) + @"\" /*+ "\""*/  + " /E")
		
		HiddenDOSCommand copyScriptsFolder
		HiddenDOSCommand copyIconsFolder
		
		colorMan.reInitIcons()
	)
	
	on btn_install pressed do
	(
		RemoveFiles()
		InstallFiles()
		
		messageBox "Extra Info has been succesfully installed! \n Enjoy!"
		DestroyDialog EIinstaller_RO
		filein ((getdir #userscripts) + "\ExtraInfo\ExtraInfoInit.ms")
	)
	
	on btn_uninstall pressed do
	(
		RemoveFiles()
		messageBox "Extra info is removed from your computer."
	)
)
CreateDialog EIinstaller_RO
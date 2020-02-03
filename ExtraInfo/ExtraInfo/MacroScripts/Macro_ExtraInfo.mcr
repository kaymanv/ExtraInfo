macroScript ExtraInfo category:"Extra Info" toolTip:"Extra Info in viewport" icon:#("ExtraInfoLogo", 1)
(
	on execute do
	(
		print "MacroScript Extra Info loaded!"
		filein ((getdir #userscripts) + "\ExtraInfo\ExtraInfoInit.ms")
	)
)
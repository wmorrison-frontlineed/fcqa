$manifest = @{
	Path 			    = 'C:\Users\wmorrison\Documents\WindowsPowerShell\Modules\FCTools\FCTools.psd1'
	Author 			    = 'Will Morrison'
	CompanyName 		= 'frontlineed.com'
	Copyright 		    = '(c)2020 Frontline Education. All rights reserved.'
	Description 		= 'FCTools module contains useful Add-ons to Windows PowerShell ISE'
	GUID 			    = 'ad26cc85-308f-4e15-9f51-bc973f530140'
	ModuleVersion 		= '1.0.0'
	PowerShellVersion 	= '3.0'
	FunctionsToExport 	= 'Push-Preview'
	ReleaseNotes 		= 'Initial Release'
	RootModule 		    = 'FCTools.psm1'
}
New-ModuleManifest @manifest
$manifest = @{
	Path 			    = 'C:\Users\wmorrison\Documents\WindowsPowerShell\Modules\ProgressBookTools\ProgressBookTools.psd1'
	Author 			    = 'Will Morrison'
	CompanyName 		= 'frontlineed.com'
	Copyright 		    = '(c)2022 Frontline Education. All rights reserved.'
	Description 		= 'ProgressBookTools module contains useful Add-ons to Windows PowerShell ISE'
	GUID 			    = '724d6c0f-3e53-41d7-bbfd-b9ae7ebfb57a'
	ModuleVersion 		= '1.0.0'
	PowerShellVersion 	= '3.0'
	FunctionsToExport 	= 'Copy-Config'
	ReleaseNotes 		= 'Initial Release'
	RootModule 		    = 'ProgressBookTools.psm1'
}
New-ModuleManifest @manifest
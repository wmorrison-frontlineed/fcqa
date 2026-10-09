$manifest = @{
	Path 			    = 'C:\Users\wmorrison\Documents\WindowsPowerShell\Modules\FrontlineTools\FrontlineTools.psd1'
	Author 			    = 'Will Morrison'
	CompanyName 		= 'Frontline Education'
	Copyright 		    = '(c)2026 Frontline Education. All rights reserved.'
	Description 		= 'FrontlineTools module contains useful Add-ons to Windows PowerShell'
	GUID 			    = '724d6c0f-3e53-41d7-bbfd-b9ae7ebfb57a'
	ModuleVersion 		= '1.0.0'
	PowerShellVersion 	= '3.0'
	FunctionsToExport 	= 'Set-Module','Start-Module'
	ReleaseNotes 		= '2026-10.acacia'
	RootModule 		    = 'FrontlineTools.psm1'
}
New-ModuleManifest @manifest
installation
install
	| installer ui |

	installer := MozInstaller new.
	ui := SpartaInstallerBrick new.
	ui installer: installer.
	ui extent: 650@300.
	ui openInBorderlessWindow.

	installer run
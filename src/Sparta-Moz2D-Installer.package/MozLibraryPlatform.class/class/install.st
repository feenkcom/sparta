installation
install
	<spartaPostLoad>
	| installer ui |

	installer := MozInstaller new.
	ui := MozInstallerBrick new.
	ui installer: installer.
	ui extent: 650@300.
	ui openInBorderlessWindow position: 0@0.

	installer run
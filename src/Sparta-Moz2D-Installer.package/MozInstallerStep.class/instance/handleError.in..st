running
handleError: anError in: anInstaller

	anInstaller announce: (MozInstallerSwitchStepBrickAnnouncement new brick: (self newErrorBrickIn: anInstaller for: anError)).	
	anInstaller flush
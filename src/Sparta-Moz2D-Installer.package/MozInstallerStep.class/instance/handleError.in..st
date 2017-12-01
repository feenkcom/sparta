running
handleError: anError in: anInstaller

	anInstaller announce: (SpartaInstallerSwitchStepBrickAnnouncement new brick: (self newErrorBrickIn: anInstaller for: anError)).	
	anInstaller flush
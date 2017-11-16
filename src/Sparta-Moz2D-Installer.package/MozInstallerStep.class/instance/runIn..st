running
runIn: anInstaller
	
	self isActive: true.
	anInstaller announce: (MozInstallerSwitchStepBrickAnnouncement new brick: (self newStepBrickIn: anInstaller)).
	
	anInstaller flush.
	
	self doActionIn: anInstaller.
	
	self isActive: false.
	self isDone: true.
	
	anInstaller flush
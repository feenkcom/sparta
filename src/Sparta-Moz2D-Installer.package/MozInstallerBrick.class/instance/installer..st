accessing
installer: anObject
	installer := anObject.
	
	installer when: #flush send: #updateNow to: self.
	installer when: MozInstallerSwitchStepBrickAnnouncement send: #stepSwitched: to: self.

	self removeAllBricks.
	self initializeBricks
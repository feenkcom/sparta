accessing
installer: anObject
	installer := anObject.
	
	installer when: #flush send: #updateNow to: self.
	installer when: SpartaInstallerSwitchStepBrickAnnouncement send: #stepSwitched: to: self.
	installer when: SpartaInstallerCloseAnnouncement send: #closeWindow to: self.

	self removeAllBricks.
	self initializeBricks
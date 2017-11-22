accessing
installer: anObject
	installer := anObject.
	
	installer when: #flush send: #updateNow to: self.
	installer when: MozInstallerSwitchStepBrickAnnouncement send: #stepSwitched: to: self.
	installer when: MozInstallerCloseAnnouncement send: #closeWindow to: self.

	self removeAllBricks.
	self initializeBricks
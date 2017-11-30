initialization
initializeSteps

	self addStep: MozInstallerValidationStep new.
	self addStep: MozInstallerPrepareStep new.
	self addStep: MozInstallerDownloadStep new.
	self addStep: MozInstallerInstallStep new.
	self addStep: MozInstallerDoneStep new
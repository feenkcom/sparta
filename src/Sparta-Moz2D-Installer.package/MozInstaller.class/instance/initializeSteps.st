initialization
initializeSteps

	self addStep: MozInstallerValidationStep new.
	self addStep: MozInstallerPrepareStep new.
	self addStep: MozInstallerDownloadStep new.
	self addStep: MozInstallerInstallStep new.
	self addStep: MozInstallerDoneStep new.
	
	
	"self addStep: (MozInstallerWaitStep new title: 'Install').
	self addStep: (MozInstallerWaitStep new title: 'Validate dependencies').
	self addStep: (MozInstallerWaitStep new title: 'Launch services').
	self addStep: (MozInstallerWaitStep new title: 'Finish')."
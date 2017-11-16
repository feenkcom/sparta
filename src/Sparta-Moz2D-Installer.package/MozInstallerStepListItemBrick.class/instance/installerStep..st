accessing
installerStep: anInstallerStep
	installerStep := anInstallerStep.
	
	installerStep when: #activated send: #beActive to: self.
	installerStep when: #deactivated send: #beNotActive to: self.
	installerStep when: #done send: #beDone to: self.
	installerStep when: #ready send: #beNotDone to: self.
	installerStep when: #titleChanged send: #titleChanged to: self.
	
	installerStep isActive
		ifTrue: [ self beActive ]
		ifFalse: [ self beNotActive ].
		
	installerStep isDone
		ifTrue: [ self beDone ]
		ifFalse: [ self beNotDone ].
		
	self titleChanged
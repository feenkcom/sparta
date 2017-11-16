running
doActionIn: anInstaller

	true ifTrue: [ ^ self ].

	self logCr: 'Moz2D installed:'.
	MozServices isRunning
		ifTrue: [
			self logCr: String tab, '- yes', String cr.
		
			self logCr: 'Moz2D library can not be upgraded once installed.'.
			self logCr: '	- Perform a fresh install in new Pharo image'.
			self logCr: '	- or manually delete libMoz2D from Virtual Machine folder and re-try again'.
		]
		ifFalse: [ self logCr: String tab, '- no'. ].

	"Library already exists and running, no need to install it again"
	MozServices isRunning
		ifTrue: [ ^ Error signal: 'Moz2D is already installed' ]
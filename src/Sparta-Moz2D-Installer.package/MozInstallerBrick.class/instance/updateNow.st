updating
updateNow	
	"We may be blocking the UI thread, and thus have to draw the world ourselves when necessary"
	
	lastUpdate := Time millisecondClockValue.
	UIManager default uiProcess == Processor activeProcess
		ifTrue: [ self currentWorld doOneCycleNow ]
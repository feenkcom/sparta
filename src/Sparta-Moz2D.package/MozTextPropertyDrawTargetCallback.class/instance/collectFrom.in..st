properties
collectFrom: aPropertyProvider in: aPropertyCollector
	| aCanvas |

	aCanvas := aPropertyProvider canvas.
	self primSetDrawTarget: aCanvas collector: aPropertyCollector
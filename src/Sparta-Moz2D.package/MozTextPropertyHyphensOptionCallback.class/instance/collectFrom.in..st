properties
collectFrom: aPropertyProvider in: aPropertyCollector
	| anOption |

	anOption := aPropertyProvider hyphensOption value.
	self primSetHyphensOption: anOption collector: aPropertyCollector
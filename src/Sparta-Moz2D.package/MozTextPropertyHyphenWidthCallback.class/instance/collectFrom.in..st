properties
collectFrom: aPropertyProvider in: aPropertyCollector
	| aWidth |

	aWidth := aPropertyProvider hyphenWidth.
	self primSetHyphenWidth: aWidth collector: aPropertyCollector
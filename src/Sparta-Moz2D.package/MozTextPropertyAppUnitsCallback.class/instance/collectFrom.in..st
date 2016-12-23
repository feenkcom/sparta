properties
collectFrom: aPropertyProvider in: aPropertyCollector
	| anAppUnits |

	anAppUnits := aPropertyProvider appUnitsPerDevUnit.
	self primSetAppUnits: anAppUnits collector: aPropertyCollector
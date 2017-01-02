accessing
breakPriority: aBreakPriority
	breakPriority := aBreakPriority.
	
	"Precompute and store hyphens option in external structure for performance reason"
	self primSetHyphensOption: self hyphensOption
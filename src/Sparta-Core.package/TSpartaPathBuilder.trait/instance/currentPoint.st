path commands
currentPoint
	"Point the current subpath is at - or where the next subpath will start
	if there is no active subpath."
	<return: #Point>

	^ self explicitRequirement
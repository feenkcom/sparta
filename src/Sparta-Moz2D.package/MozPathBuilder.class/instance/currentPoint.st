path commands
currentPoint
	"Point the current subpath is at - or where the next subpath will start
	if there is no active subpath."
	<return: #Point>
	| aMozPoint aPoint |

	aMozPoint := MozNativePoint externalNew.
	self primCurrentPoint: aMozPoint.
	aPoint := aMozPoint asPoint.
	aMozPoint free.
	
	^ aPoint
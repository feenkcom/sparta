private
arcTo: aPoint angle: angle cw: aBool
	"Add a clockwise arc segment, starting from current path endpoint and
	ending at andPt. Angle should be specified in radians"
	^ self explicitRequirement
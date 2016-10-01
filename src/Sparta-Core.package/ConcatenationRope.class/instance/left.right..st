initialization
left: aLeftRope right: aRightRope
	left := aLeftRope.
	right := aRightRope.
	depth := (left depth max: right depth) + 1.
	length := left size + right size.
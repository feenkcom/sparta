initialization
left: aLeftRope right: aRightRope
	left := aLeftRope.
	right := aRightRope.
	depth := (left depth max: right depth) + 1.
	length := left size + right size.
	count := left count + right count + 1.
	balance := ((left depth - right depth) abs / (left depth + right depth + 1.0) + left balanceGrade + right balanceGrade).
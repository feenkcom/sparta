shapes
roundedRectangle: aRectangle radii: cornerRadii
	| min tlr trr brr blr x y right bottom |

	min := (aRectangle width min: aRectangle height) / 2.0.
	tlr := cornerRadii topLeft min: min.
	trr := cornerRadii topRight min: min.
	brr := cornerRadii bottomRight min: min.
	blr := cornerRadii bottomLeft min: min.
	
	x := aRectangle left.
	y := aRectangle top.
	right := aRectangle right.
	bottom := aRectangle bottom.

	^ canvas path
		absolute;
		
		moveTo: x @ (y + tlr);
		cwArcTo: (x + tlr) @ y;
		
		lineTo: (right - trr) @ y;
		cwArcTo: right @ (y + trr);
		
		lineTo: right @ (bottom - brr);
		cwArcTo: (right - brr) @ bottom;
		
		lineTo: (x + blr) @ bottom;
		cwArcTo: x @ (bottom - blr);
		
		close;
		finish
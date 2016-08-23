private
arcTo: aPoint angle: angle cw: aBool

	(angle = (Float pi / 2))
		"We can nicely optimize calculations for angle == PI/2"
		ifTrue: [
			self
				primArcToX: aPoint x
				originY: aPoint y
				antiClockwise: aBool not
				absolute: self isAbsolute  ]
		ifFalse: [
			self
				primArcToX: aPoint x
				originY: aPoint y
				angle: angle
				antiClockwise: aBool not
				absolute: self isAbsolute ]

	
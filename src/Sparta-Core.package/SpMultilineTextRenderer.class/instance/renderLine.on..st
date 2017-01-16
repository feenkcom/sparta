rendering
renderLine: aLine on: aCanvas

	aLine do: [ :span |
		self renderSpan: span on: aCanvas ]
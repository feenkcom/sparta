rendering
renderLine: aLine on: aCanvas

	aLine do: [ :span |
		self renderSpan: span on: aCanvas.
		self baseline: (self baseline x + span width) @ self baseline y ]
rendering
renderOn: aCanvas

	layout spans do: [ :aSpan |
		self renderSpan: aSpan on: aCanvas ]
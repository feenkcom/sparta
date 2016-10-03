rendering
renderOn: aCanvas
	
	baseline := 0@0.
	layout lines do: [ :line |
		baseline := 0 @ (baseline y + line ascent).
		self renderLine: line on: aCanvas.
		baseline := 0 @ (baseline y + line descent) ]
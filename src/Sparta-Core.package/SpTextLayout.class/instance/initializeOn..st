initialization
initializeOn: aCanvas
	| iterator context |

	lines := OrderedCollection new.
	context := SpTextLayoutContext new.
	context rope: rope.
	context maxWidth: maxWidth.
	context maxHeight: maxHeight.
	
	iterator := self rope iterator: 1 to: self rope size.

	[ iterator hasNext and: [ context availableHeight > 0 ] ] whileTrue: [ 
		| line |
		"If we pass while-check we definitely moved to the next line,
		so can do the same with position"
		context movePosition: iterator position.
		line := iterator nextLine.
		self initializeLine: line on: aCanvas with: context ].
	
	height := 0.
	context lines do: [ :aLine |
		lines add: aLine.
		aLine baseline: 0@(height + aLine ascent).
		width := width max: aLine width.
		height := height + aLine height ].
	
	end := context position.
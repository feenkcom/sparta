initialization
initializeOn: aCanvas
	| iterator context |

	lines := OrderedCollection new.
	context := SpartaTextLayoutContext new layout: self.
	iterator := self rope iterator: 1 to: self rope size.

	[ iterator hasNext and: [ context availableHeight > 0 ] ] whileTrue: [ 
		| line |
		"If we pass while-check we definitely moved to the next line,
		so can do the same with position"
		context movePosition: iterator position.
		line := iterator nextLine.
		self initializeLine: line on: aCanvas with: context ].
	
	end := context position.
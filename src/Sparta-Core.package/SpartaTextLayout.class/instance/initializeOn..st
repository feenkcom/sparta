initialization
initializeOn: aCanvas
	| iterator context |

	lines := OrderedCollection new.
	context := SpartaTextLayoutContext new layout: self.
	iterator := self rope iterator: 1 to: self rope size.

	[ iterator hasNext and: [ context availableHeight > 0 ] ] whileTrue: [ 
		| line |
		line := iterator nextLine.
		self initializeLine: line on: aCanvas with: context ]
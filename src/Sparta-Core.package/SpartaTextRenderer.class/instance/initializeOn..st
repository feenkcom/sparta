initialization
initializeOn: aCanvas
	| iterator |

	lines := OrderedCollection new.
	iterator := self rope iterator: self start to: self end.
	
	[ iterator hasNext ] whileTrue: [ 
		| line |
		line := iterator nextLine.
		self initializeLine: line on: aCanvas ]
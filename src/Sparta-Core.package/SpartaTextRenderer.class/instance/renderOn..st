rendering
renderOn: aCanvas
	| iterator |

	iterator := self rope iterator: self start to: self end.
	[ iterator hasNext ] whileTrue: [ 
		| line |
		line := iterator nextLine.
		self renderLine: line on: aCanvas ]
geometry
height
	"Return measured height of the layout.
	Note, that height is always smaller or equal to maxHeight"
	<return: #Number>
	self
		assert: [ height <= maxHeight ]
		description: [ 'Height must be smaller or equal to maximum height. Check measurement logic' ].

	^ height
geometry
width
	"Return measured width of the layout.
	Note, that height is always smaller or equal to maxWidth"
	<return: #Number>
	self
		assert: [ width <= maxWidth ]
		description: [ 'Height must be smaller or equal to maximum width. Check measurement logic' ].

	^ width
accessing
rope
	"Return a text rope I am assigned to"
	<return: #SpRope>

	self
		assert: [ rope isNotNil ]
		description: [ 'Rope must never be nil' ].

	^ rope
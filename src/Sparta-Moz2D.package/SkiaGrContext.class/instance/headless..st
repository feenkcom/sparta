initialization
headless: aBoolean
	"Set if I was created for headless mode"

	self
		assert: [ isHeadless isNil ]
		description: [ 'Mode can not be changed on fly' ].

	isHeadless := aBoolean
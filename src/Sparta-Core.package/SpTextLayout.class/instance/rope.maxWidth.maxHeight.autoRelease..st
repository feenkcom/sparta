initialization
rope: aRope maxWidth: aMaxWidth maxHeight: aMaxHeight autoRelease: shouldAutoRelease
	"Construct me with an immutable rope and given properties.
	Note, that I can be only initialized once.
	Once done, you need to initialize me (build lines or words) providing
	an instance of SpartaCanvas as context provider.
	For that send me #initializeOn: message with canvas as an argument"

	self
		assert: [ rope isNil ]
		description: [ 'I am immutable! You should create a new instance' ].

	rope := aRope.
	maxWidth := aMaxWidth.
	maxHeight := aMaxHeight.
	autoRelease := shouldAutoRelease
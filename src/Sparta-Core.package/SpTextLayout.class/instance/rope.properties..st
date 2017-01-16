initialization
rope: aRope properties: aDictionary
	"Construct me with an immutable rope and properties as dictionary.
	Note, that I can be only initialized once.
	Once done, you need to initialize me (build lines or words) providing
	an instance of SpartaCanvas as context provider.
	For that send me #initializeOn: message with canvas as an argument"
	| aProperties |

	self
		assert: [ rope isNil ]
		description: [ 'I am immutable! You should create a new instance' ].
	
	aProperties := aDictionary asDictionary.

	rope := aRope.
	maxWidth := aProperties at: #maxWidth ifAbsent: [ Float infinity ].
	maxHeight := aProperties at: #maxHeight ifAbsent: [ Float infinity ].
	autoRelease := aProperties at: #autoRelease ifAbsent: [ true ]
initialization
initialize
	self ensureIceberg.
	repository := (Smalltalk classNamed: #IceRepository) origin: 'git@github.com:syrel/sparta.git'.
	repository checkoutBranch: 'v1.0'.
	repository subdirectory: 'src'.
	repository register
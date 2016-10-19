initialization
initialize
	self ensureIceberg.
	repository := (Smalltalk classNamed: #IceRepository) origin: 'git@github.com:syrel/sparta.git'.
	repository subdirectory: 'src'.
	repository checkoutBranch: 'v1.1'.
	repository register
testing
isValid
	"Return true if I am a valid callback function, false otherwise"
	<return: #Boolean>

	^ session == Smalltalk session
		and: [ thunk isNull not ]
tests
testTextRunMemoryLeak
	| aTextRun |

	aTextRun := MozTextRun fromString: 'Haba'.
	"We own text run => 1 reference"
	self assert: aTextRun refCount equals: 1.
	
	"to make sure that we don't crash"
	aTextRun release
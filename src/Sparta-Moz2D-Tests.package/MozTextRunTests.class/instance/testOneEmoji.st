tests
testOneEmoji
	| aTextRun |

	aTextRun := MozTextRun fromString: '😃'.
	
	self assert: aTextRun length equals: 1. 
	self assert: aTextRun size equals: 2.
	self assert: aTextRun bits equals: 32.
	self assert: aTextRun buffer equals: #[61 216 3 222].
	self assert: aTextRun is8Bit not.
	self assert: aTextRun is16Bit not.
	self assert: aTextRun is32Bit.
tests
testOneAsciiCharacter
	| aTextRun |

	aTextRun := MozTextRun fromString: 'a'.
	
	self assert: aTextRun length equals: 1. 
	self assert: aTextRun size equals: 1.
	self assert: aTextRun bits equals: 8.
	self assert: aTextRun buffer equals: 'a'.
	self assert: aTextRun is8Bit.
	self assert: aTextRun is32Bit not.
	self assert: aTextRun is16Bit not.
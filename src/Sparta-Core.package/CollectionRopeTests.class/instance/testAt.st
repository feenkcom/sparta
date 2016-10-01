tests
testAt
	| elements |
	elements := (1 to: self collection size) collect: [ :index | rope at: index ].
	self assert: elements equals: self collection
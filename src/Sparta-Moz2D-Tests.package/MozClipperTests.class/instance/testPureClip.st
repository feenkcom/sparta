tests
testPureClip
	| clip inside outside partially |
	clip := 100@100 extent: 300@300.
	inside := 150@150 extent: 100@100.
	outside := 0@0 extent: 50@50.
	partially := 50@50 extent: 100@100.

	canvas clip by: clip during: [ 
		self assert: canvas clip localBounds equals: clip.
		self assert: canvas clip globalBounds equals: clip.
		self assert: (canvas clip containsLocal: clip).
		self assert: (canvas clip containsGlobal: clip).
		self assert: (canvas clip containsLocal: inside).
		self assert: (canvas clip containsGlobal: inside).
		self assert: (canvas clip containsLocal: partially).
		self assert: (canvas clip containsGlobal: partially).
		self assert: (canvas clip containsLocal: outside) not.
		self assert: (canvas clip containsGlobal: outside) not ]
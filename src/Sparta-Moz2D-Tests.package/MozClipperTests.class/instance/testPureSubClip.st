tests
testPureSubClip
	| clip subclip intersect inside outside partially |
	clip := 100@100 extent: 300@300.
	subclip := 250@50 extent: 200@200.
	intersect := clip intersect: subclip.
	
	inside := 300@150 extent: 50@50.
	outside := 150@150 extent: 50@50.
	partially := 300@75 extent: 50@50.

	canvas clip by: clip during: [ 
		canvas clip by: subclip during: [
			self assert: canvas clip localBounds equals: intersect.
			self assert: canvas clip globalBounds equals: intersect.
			self assert: (canvas clip containsLocal: clip).
			self assert: (canvas clip containsGlobal: clip).
			self assert: (canvas clip containsLocal: subclip).
			self assert: (canvas clip containsGlobal: subclip).
			self assert: (canvas clip containsLocal: inside).
			self assert: (canvas clip containsGlobal: inside).
			self assert: (canvas clip containsLocal: partially).
			self assert: (canvas clip containsGlobal: partially).
			self assert: (canvas clip containsLocal: outside) not.
			self assert: (canvas clip containsGlobal: outside) not ] ]
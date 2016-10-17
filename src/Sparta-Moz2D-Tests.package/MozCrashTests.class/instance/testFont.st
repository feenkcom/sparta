tests
testFont
	| font |
	font := canvas font
		size: 13;
		weightThin;
		sansSerif;
		build.
		
	self assert: font isNotNil
Extension { #name : #Morph }

{ #category : #'*Sparta-Moz2D-Installer' }
Morph >> mozOpenInWindowAt: aPoint [
	| aWorld window extent |
	
	aWorld := self currentWorld.
	
	window := (SystemWindow labelled: '') model: nil.
	window 
		" guess at initial extent"
		bounds:  (aPoint extent: self fullBounds extent);
		addMorph: self frame: (0@0 extent: 1@1);
		updatePaneColors.
	" calculate extent after adding in case any size related attributes were changed.  Use
	fullBounds in order to trigger re-layout of layout morphs"
	extent := self fullBounds extent + 
			(window borderWidth@window labelHeight) + window borderWidth +
			(window class borderWidth * 2 @ (window class borderWidth + 1)). "include inset margin"
	window extent: extent.
	aWorld addMorph: window.
	window activate.
	aWorld startSteppingSubmorphsOf: window.
	
	window announceOpened.
	^window

]

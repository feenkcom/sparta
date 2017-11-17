private
image: aForm at: aPoint sourceRect: sourceRect rule: rule
	"Note: The public use of this protocol is deprecated. It will become private. Nobody in the outside world must assume that a thing like a combination rule has any specific effect."
	| aSourceForm |
	
	aSourceForm := (sourceRect = (0 @ 0 extent: aForm extent))
		ifTrue: [ aForm ]
		ifFalse: [ aForm copy: sourceRect ].
	
	self canvas fill
		path: (aPoint extent: aSourceForm extent);
		paint: aSourceForm;
		draw
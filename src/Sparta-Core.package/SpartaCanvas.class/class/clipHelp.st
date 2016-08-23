help
clipHelp
	^
'canvas clip
	- to start clipping drawing region
	
	canvas clip
		by: (0@0 extent: 200@200)
		during: [ "perform drawing operations here" ]
		
	or
	
	canvas clip
		push: (0@0 extent: 200@200).
	"perform drawing operations here"
	canvas clip
		pop'
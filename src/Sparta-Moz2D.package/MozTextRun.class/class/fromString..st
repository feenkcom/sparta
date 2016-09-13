instance creation
fromString: aString
	"Toy API. For testing purpose only"
	| canvas font flags |
	canvas := MozCanvas extent: 1@1.
	
	font := canvas font
		size: 20;
		sansSerif;
		build.

	flags := 0.
	flags := flags | MozTextFlags TEXT_ENABLE_HYPHEN_BREAKS value.
	flags := flags | MozTextFlags TEXT_ENABLE_SPACING value.
	flags := flags | MozTextFlags TEXT_NEED_BOUNDING_BOX value.
		
	^ font makeTextRun: aString canvas: canvas flags: flags
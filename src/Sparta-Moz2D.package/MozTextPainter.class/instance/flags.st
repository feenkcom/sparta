instance creation
flags
	| theFlags |

	"BoundingBox (text metrics bounds) will be initialized properly based on glyph extents,
	in particular, glyph extents that overflow the standard font-box (the box defined by the ascent, descent
	and advance width of the glyph). When not set, it may just be the standard font-box even if glyphs overflow"	
	theFlags := MozTextFlags TEXT_NEED_BOUNDING_BOX value.

	breakPriority canWrapHyphens
		ifTrue: [ theFlags := theFlags | MozTextFlags TEXT_ENABLE_HYPHEN_BREAKS value ].
	spacing isZero
		ifFalse: [ theFlags := theFlags |  MozTextFlags TEXT_ENABLE_SPACING value ].
	
	^ theFlags
bounding box types
tightInkExtents
	"Set bounding box type to a box that tightly encloses
	all the painted pixels (although actually on Windows,
	at least, it may be slightly larger than strictly necessary
	because we can't get precise extents with ClearType)."

	boxType := MozTextBoundingBoxType TIGHT_INK_EXTENTS
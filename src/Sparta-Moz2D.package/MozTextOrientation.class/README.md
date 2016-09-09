Field for orientation of the textrun and glyphs within it.

Possible values of the TEXT_ORIENT_MASK field:
	TEXT_ORIENT_HORIZONTAL
	TEXT_ORIENT_VERTICAL_UPRIGHT
	TEXT_ORIENT_VERTICAL_SIDEWAYS_RIGHT
	TEXT_ORIENT_VERTICAL_SIDEWAYS_LEFT
	TEXT_ORIENT_VERTICAL_MIXED
For all VERTICAL settings, the x and y coordinates of glyph positions are exchanged, so that simple advances are vertical.

The MIXED value indicates vertical textRuns for which the CSS text-orientation property is 'mixed', but is never used for individual glyphRuns; it will be resolved to either UPRIGHT or SIDEWAYS_RIGHT according to the UTR50 properties of the characters, and separate glyphRuns created for the resulting glyph orientations.
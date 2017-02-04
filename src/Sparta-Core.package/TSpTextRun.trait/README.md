I define an API of a Text run - an object that holds an array of glyphs that represent a piece of text.

Note that TextRun is optimised for the case of simple ASCII string (all chars are 8 bit), simple multilanguage string (all chars are 16 bit) and complex scripts (characters have various length of 8-32 bits).

Users should never instantiate TextRun directly, instead ask TextPainter to do the necessary job - it is needed to support backend specific text runs
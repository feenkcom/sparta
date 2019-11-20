"
Each Glyph is represented as uint16, so we store them in a byte array of uint8 where each glyph occupies two bytes
"
Class {
	#name : #SkiaTextGlyphs,
	#superclass : #Object,
	#instVars : [
		'bytes'
	],
	#category : #'Sparta-Skia-Text'
}

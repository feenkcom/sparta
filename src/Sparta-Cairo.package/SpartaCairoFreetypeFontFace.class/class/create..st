instance creation
create: aFreetypeFont
	"Create a cairo font face for a given freetype face"
	<return: #SpartaCairoFreetypeFontFace>
	| aCairoFontFace aSynthesize |

	aCairoFontFace := self primCreate: aFreetypeFont face handle asExternalPointer.
	aCairoFontFace status isSuccess
		ifFalse: [ SpartaCairoStatus signal: aCairoFontFace status ].
	aCairoFontFace autoRelease.
	
	aSynthesize := 0.
	aFreetypeFont isSimulatedBold
		ifTrue: [ aSynthesize := aSynthesize | SpartaCairoFreetypeSynthesize CAIRO_FT_SYNTHESIZE_BOLD value ].
		
	aFreetypeFont isSimulatedItalic
		ifTrue: [ aSynthesize := aSynthesize | SpartaCairoFreetypeSynthesize CAIRO_FT_SYNTHESIZE_OBLIQUE value ].
	
	aCairoFontFace synthesize: aSynthesize.
	aCairoFontFace freetypeFont: aFreetypeFont.
	
	^ aCairoFontFace
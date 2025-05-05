Class {
	#name : #SpartaCairoFreetypeFontFace,
	#superclass : #SpartaCairoFontFace,
	#instVars : [
		'freetypeFont'
	],
	#category : #'Sparta-Cairo-Text'
}

{ #category : #'instance creation' }
SpartaCairoFreetypeFontFace class >> create: aFreetypeFont [
	"Create a cairo font face for a given freetype face"

	<return: #SpartaCairoFreetypeFontFace>
	| aCairoFontFace aSynthesize |
	aCairoFontFace := self
			primCreate: aFreetypeFont face getHandle asExternalPointer.
	aCairoFontFace status isSuccess
		ifFalse: [ SpartaCairoStatus signal: aCairoFontFace status ].
	aCairoFontFace autoRelease.

	aSynthesize := 0.
	aFreetypeFont isSimulatedBold
		ifTrue: [ aSynthesize := aSynthesize
					| SpartaCairoFreetypeSynthesize CAIRO_FT_SYNTHESIZE_BOLD value ].

	aFreetypeFont isSimulatedItalic
		ifTrue: [ aSynthesize := aSynthesize
					| SpartaCairoFreetypeSynthesize CAIRO_FT_SYNTHESIZE_OBLIQUE value ].

	aCairoFontFace synthesize: aSynthesize.
	aCairoFontFace freetypeFont: aFreetypeFont.

	^ aCairoFontFace
]

{ #category : #'private - ffi' }
SpartaCairoFreetypeFontFace class >> primCreate: aFreetypeFontFace [

	^ self ffiCall: #(SpartaCairoFreetypeFontFace cairo_ft_font_face_create_for_ft_face ( void* aFreetypeFontFace, 0 ) )
]

{ #category : #accessing }
SpartaCairoFreetypeFontFace >> freetypeFont [
	^ freetypeFont
]

{ #category : #accessing }
SpartaCairoFreetypeFontFace >> freetypeFont: anObject [
	freetypeFont := anObject
]

{ #category : #accessing }
SpartaCairoFreetypeFontFace >> pointSize [
	^ freetypeFont pointSize
]

{ #category : #'private - ffi' }
SpartaCairoFreetypeFontFace >> primGetSynthesize [

	^ self ffiCall: #(uint cairo_ft_font_face_get_synthesize ( self ) )
]

{ #category : #'private - ffi' }
SpartaCairoFreetypeFontFace >> primSetSynthesize: aNumber [

	^ self ffiCall: #(void cairo_ft_font_face_set_synthesize ( self, uint aNumber ) )
]

{ #category : #accessing }
SpartaCairoFreetypeFontFace >> synthesize [
	<return: #Number>

	^ self primGetSynthesize
]

{ #category : #accessing }
SpartaCairoFreetypeFontFace >> synthesize: aNumber [

	self primSetSynthesize: aNumber
]

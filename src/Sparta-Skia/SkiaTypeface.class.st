Class {
	#name : #SkiaTypeface,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaTypeface class >> default [
	^ self new
]

{ #category : #'instance creation' }
SkiaTypeface class >> familyName: aFamilyName fontStyle: aSkiaFontStyle [
	| aBoxerString |
	
	aBoxerString := GtBoxerString fromString: aFamilyName.
	^ [ self fromNativeHandle: (self primFromFamilyName: aBoxerString fontStyle: aSkiaFontStyle) ]
		ensure: [ aBoxerString release ]
]

{ #category : #'private - ffi' }
SkiaTypeface class >> primCreate [
	^ self ffiCall: #(void* skia_typeface_default())
]

{ #category : #'private - ffi' }
SkiaTypeface class >> primFromFamilyName: aGtBoxerString fontStyle: aSkiaFontStyle [
	^ self ffiCall: #(void* skia_typeface_from_name(GtBoxerString aGtBoxerString, SkiaFontStyle aSkiaFontStyle))
]

{ #category : #'private - ffi' }
SkiaTypeface class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_typeface_drop(void* aHandle))
]

{ #category : #accessing }
SkiaTypeface >> familyName [
	<return: #String>

	^ GtBoxerString getStringFrom: [ :aBoxerString | self primGetFamilyName: aBoxerString ]
]

{ #category : #accessing }
SkiaTypeface >> fontStyle [
	<return: #SkiaFontStyle>

	^ SkiaFontStyle fromNativeHandle: self primGetFontStyle
]

{ #category : #'gt-extension' }
SkiaTypeface >> gtFontStyleFor: aView [
	<gtView>

	^ (self fontStyle gtInfoFor: aView)
			title: 'Style';
			priority: 3
]

{ #category : #'gt-extension' }
SkiaTypeface >> gtInfoFor: aView [
	<gtView>

	^ ({
		#familyName -> self familyName.
		#fontStyle -> self fontStyle.
		#isBold -> self isBold.
		#isFixedPitch -> self isFixedPitch.
		#isItalic -> self isItalic.
	 } asOrderedDictionary gtItemsFor: aView)
			title: 'Info';
			priority: 2
]

{ #category : #'gt-extension' }
SkiaTypeface >> gtPreviewFor: aView [
	<gtView>

	^ aView explicit
		title: 'Preview';
		priority: 1;
		stencil: [
			| aSkiaCanvas aString aFont theMeasuredLines aMaxWidth aMaxHeight aBaseline |
			
			aSkiaCanvas := SkiaCanvas extent: 1@1.
			
			aFont := SkiaFont typeface: self size: 40.

			aString := 'ABCDEFGHIJKLM
NOPQRSTUVWXYZ
abcdefghijklm
nopqrstuvwxyz
1234567890'.

			theMeasuredLines := aString lines collect: [ :eachLine |
				eachLine -> (aSkiaCanvas text
					font: aFont;
					string: eachLine;
					measure) ].
			
			aMaxWidth := theMeasuredLines max: [ :eachMeasuredLine | eachMeasuredLine value textMetrics width ].
			aMaxHeight := theMeasuredLines sum: [ :eachMeasuredLine | eachMeasuredLine value fontMetrics lineSpacing ].
			aSkiaCanvas release.
				
			aSkiaCanvas := SkiaCanvas extent: (aMaxWidth @ aMaxHeight) + 40.
			
			aBaseline := theMeasuredLines first value fontMetrics ascent negated + 20.
			theMeasuredLines do: [ :eachMeasuredLine |
				
				aSkiaCanvas text
					font: aFont;
					string: eachMeasuredLine key;
					baseline: ((aSkiaCanvas width - eachMeasuredLine value textMetrics width) / 2.0) @ aBaseline;
					paint: Color black;
					draw.
				
				aBaseline := aBaseline +  eachMeasuredLine value fontMetrics lineSpacing ].
			aSkiaCanvas asForm asElement ]
]

{ #category : #testing }
SkiaTypeface >> isBold [
	^ self primIsBold
]

{ #category : #testing }
SkiaTypeface >> isFixedPitch [
	^ self primIsFixedPitch
]

{ #category : #testing }
SkiaTypeface >> isItalic [
	^ self primIsItalic
]

{ #category : #'private - ffi' }
SkiaTypeface >> primGetFamilyName: aGtBoxerString [
	^ self ffiCall: #(void skia_typeface_get_family_name(self, GtBoxerString aGtBoxerString))
]

{ #category : #'private - ffi' }
SkiaTypeface >> primGetFontStyle [
	^ self ffiCall: #(void* skia_typeface_get_font_style(self))
]

{ #category : #'private - ffi' }
SkiaTypeface >> primIsBold [
	^ self ffiCall: #(bool skia_typeface_is_bold(self))
]

{ #category : #'private - ffi' }
SkiaTypeface >> primIsFixedPitch [
	^ self ffiCall: #(bool skia_typeface_is_fixed_pitch(self))
]

{ #category : #'private - ffi' }
SkiaTypeface >> primIsItalic [
	^ self ffiCall: #(bool skia_typeface_is_italic(self))
]

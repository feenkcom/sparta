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
SkiaTypeface >> gtInforFor: aView [
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

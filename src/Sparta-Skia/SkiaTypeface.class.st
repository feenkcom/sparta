Class {
	#name : 'SkiaTypeface',
	#superclass : 'SkiaExternalObject',
	#category : 'Sparta-Skia-External'
}

{ #category : 'instance creation' }
SkiaTypeface class >> default [
	^ self new
]

{ #category : 'instance creation' }
SkiaTypeface class >> familyName: aFamilyName fontStyle: aSkiaFontStyle [
	| aBoxerString |
	
	aBoxerString := GtBoxerString fromString: aFamilyName.
	^ [ self fromNativeHandle: (self primFromFamilyName: aBoxerString fontStyle: aSkiaFontStyle) ]
		ensure: [ aBoxerString release ]
]

{ #category : 'private - ffi' }
SkiaTypeface class >> primCreate [
	^ self ffiCall: #(void* skia_typeface_default())
]

{ #category : 'private - ffi' }
SkiaTypeface class >> primFromFamilyName: aGtBoxerString fontStyle: aSkiaFontStyle [
	^ self ffiCall: #(void* skia_typeface_from_name(GtBoxerString aGtBoxerString, SkiaFontStyle aSkiaFontStyle))
]

{ #category : 'private - ffi' }
SkiaTypeface class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_typeface_drop(void** aHandle))
]

{ #category : 'copying' }
SkiaTypeface >> clone [
	<return: #SkiaTypeface>

	^ self class fromNativeHandle: self primClone
]

{ #category : 'accessing' }
SkiaTypeface >> familyName [
	<return: #String>

	^ GtBoxerString getStringFrom: [ :aBoxerString | self primGetFamilyName: aBoxerString ]
]

{ #category : 'accessing' }
SkiaTypeface >> fontStyle [
	<return: #SkiaFontStyle>

	^ SkiaFontStyle fromNativeHandle: self primGetFontStyle
]

{ #category : 'gt-extension' }
SkiaTypeface >> gtFontStyleFor: aView [
	<gtView>

	^ (self fontStyle gtInfoFor: aView)
			title: 'Style';
			priority: 3
]

{ #category : 'gt-extension' }
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

{ #category : 'gt-extension' }
SkiaTypeface >> gtPreviewFor: aView [
	<gtView>

	^ ((SkiaFont typeface: self clone size: 40) gtPreviewFor: aView)
		title: 'Preview';
		priority: 1
]

{ #category : 'testing' }
SkiaTypeface >> isBold [
	^ self primIsBold
]

{ #category : 'testing' }
SkiaTypeface >> isFixedPitch [
	^ self primIsFixedPitch
]

{ #category : 'testing' }
SkiaTypeface >> isItalic [
	^ self primIsItalic
]

{ #category : 'private - ffi' }
SkiaTypeface >> primClone [
	^ self ffiCall: #(void* skia_typeface_clone(self))
]

{ #category : 'private - ffi' }
SkiaTypeface >> primGetFamilyName: aGtBoxerString [
	^ self ffiCall: #(void skia_typeface_get_family_name(self, GtBoxerString aGtBoxerString))
]

{ #category : 'private - ffi' }
SkiaTypeface >> primGetFontStyle [
	^ self ffiCall: #(void* skia_typeface_get_font_style(self))
]

{ #category : 'private - ffi' }
SkiaTypeface >> primIsBold [
	^ self ffiCall: #(bool skia_typeface_is_bold(self))
]

{ #category : 'private - ffi' }
SkiaTypeface >> primIsFixedPitch [
	^ self ffiCall: #(bool skia_typeface_is_fixed_pitch(self))
]

{ #category : 'private - ffi' }
SkiaTypeface >> primIsItalic [
	^ self ffiCall: #(bool skia_typeface_is_italic(self))
]

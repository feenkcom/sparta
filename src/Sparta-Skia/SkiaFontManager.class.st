Class {
	#name : #SkiaFontManager,
	#superclass : #SkiaExternalObject,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Sparta-Skia-External'
}

{ #category : #accessing }
SkiaFontManager class >> default [
	^ uniqueInstance
		ifNil: [ uniqueInstance := self new ]
		ifNotNil: [ :aFontManager | aFontManager isNull
			ifTrue: [ uniqueInstance := self new ]
			ifFalse: [ uniqueInstance ] ]
]

{ #category : #'private - ffi' }
SkiaFontManager class >> primCreate [
	^ self ffiCall: #(void* skia_font_manager_default())
]

{ #category : #'private - ffi' }
SkiaFontManager class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_font_manager_drop(void* aHandle))
]

{ #category : #accessing }
SkiaFontManager >> countFamilies [
	<return: #Number>

	^ self primCountFamilies
]

{ #category : #private }
SkiaFontManager >> familyNameAt: anIndex [
	<return: #String>

	^ GtBoxerString getStringFrom: [ :aBoxerString | self primGetFamilyName: aBoxerString at: anIndex - 1 ]
]

{ #category : #accessing }
SkiaFontManager >> familyNames [
	<return: #Array of: #String>
	
	^ (1 to: self countFamilies) collect: [ :anIndex | self familyNameAt: anIndex ]
]

{ #category : #'gt-extension' }
SkiaFontManager >> gtFamilyNamesFor: aView [
	<gtView>
	
	^ aView list
		title: 'Families';
		priority: 10;
		items: [ self familyNames ]
]

{ #category : #private }
SkiaFontManager >> matchFamilyName: aFamilyName [
	<return: #SkiaFontStyleSet>
	| aGtBoxerString |
	
	aGtBoxerString := GtBoxerString fromString: aFamilyName.
	^ SkiaFontStyleSet fromNativeHandle: (self primMatchFamilyName: aGtBoxerString).
]

{ #category : #private }
SkiaFontManager >> matchFamilyName: aFamilyName weight: aWeight width: aSkiaFontStyleWidth slant: aSkiaFontStyleSlant ifFound: aFoundBlock ifNone: aNotFoundBlock [
	| aGtBoxerString aTypeface |
	
	aGtBoxerString := GtBoxerString fromString: aFamilyName.
	aTypeface := SkiaTypeface fromNativeHandle: (self primMatchFamilyName: aGtBoxerString weight: aWeight width: aSkiaFontStyleWidth slant: aSkiaFontStyleSlant).

	^ aTypeface isNull
		ifTrue: aNotFoundBlock 
		ifFalse: [ aFoundBlock value: aTypeface ]
]

{ #category : #'instance creation' }
SkiaFontManager >> newTypeface: aByteArray [
	"I create a new typeface from a given byte array"
	| aGtBoxerArrayU8 |
	
	aGtBoxerArrayU8 := GtBoxerArrayU8 withAll: aByteArray.
	^ [ SkiaTypeface fromNativeHandle: (self primNewTypefaceFromData: aGtBoxerArrayU8) ]
		ensure: [ aGtBoxerArrayU8 release ]
]

{ #category : #'private - ffi' }
SkiaFontManager >> primCountFamilies [
	^ self ffiCall: #(size_t skia_font_manager_count_families(self))
]

{ #category : #'private - ffi' }
SkiaFontManager >> primGetFamilyName: aGtBoxerString at: anIndex [
	^ self ffiCall: #(void skia_font_manager_get_family_name_at(self, GtBoxerString aGtBoxerString, size_t anIndex))
]

{ #category : #'private - ffi' }
SkiaFontManager >> primMatchFamilyName: aGtBoxerString [
	^ self ffiCall: #(void* skia_font_manager_match_family(
		self,
		GtBoxerString aGtBoxerString))
]

{ #category : #'private - ffi' }
SkiaFontManager >> primMatchFamilyName: aGtBoxerString weight: aWeight width: aSkiaFontStyleWidth slant: aSkiaFontStyleSlant [
	^ self ffiCall: #(void* skia_font_manager_match_family_style(
		self,
		GtBoxerString aGtBoxerString
		int32 aWeight,
		SkiaFontStyleWidth aSkiaFontStyleWidth,
		SkiaFontStyleSlant aSkiaFontStyleSlant))
]

{ #category : #'private - ffi' }
SkiaFontManager >> primNewTypefaceFromData: aGtBoxerArrayU8 [
	^ self ffiCall: #(void* skia_font_manager_new_typeface_from_data(self, GtBoxerArrayU8 aGtBoxerArrayU8))
]

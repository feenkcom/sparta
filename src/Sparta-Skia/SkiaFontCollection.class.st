Class {
	#name : #SkiaFontCollection,
	#superclass : #SkiaExternalObject,
	#classInstVars : [
		'uniqueInstance',
		'session'
	],
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaFontCollection class >> createDefaultInstance [
	^ self new
		defaultFontManager: SkiaFontManager default;
		assetTypefaceFontProvider: SkiaTypefaceFontProvider default
]

{ #category : #'instance creation' }
SkiaFontCollection class >> default [
	^ (uniqueInstance isNotNil and: [ session == Smalltalk session ])
		ifTrue: [ uniqueInstance ]
		ifFalse: [
			session := Smalltalk session.
			uniqueInstance := self createDefaultInstance ]
]

{ #category : #'private - ffi' }
SkiaFontCollection class >> primCreate [
	^ self ffiCall: #(void* skia_font_collection_new())
]

{ #category : #'private - ffi' }
SkiaFontCollection class >> primRelease: aHandle [
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_font_collection_drop(void* aHandle))
]

{ #category : #'api - font collection' }
SkiaFontCollection >> assetTypefaceFontProvider: aSkiaTypefaceFontProvider [
	self primSetAssetFontManager: aSkiaTypefaceFontProvider
]

{ #category : #'api - font collection' }
SkiaFontCollection >> defaultFontManager: aSkiaFontManager [
	self primSetDefaultFontManager: aSkiaFontManager
]

{ #category : #'private - ffi' }
SkiaFontCollection >> primSetAssetFontManager: aSkiaTypefaceFontProvider [
	self ffiCall: #(void skia_font_collection_set_asset_font_manager(
		self,
		SkiaTypefaceFontProvider aSkiaTypefaceFontProvider))
]

{ #category : #'private - ffi' }
SkiaFontCollection >> primSetDefaultFontManager: aSkiaFontManager [
	self ffiCall: #(void skia_font_collection_set_default_font_manager(self, SkiaFontManager aSkiaFontManager))
]

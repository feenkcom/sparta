Class {
	#name : #SkiaFontCollection,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaFontCollection class >> primCreate [
	^ self ffiCall: #(void* skia_font_collection_new())
]

{ #category : #'private - ffi' }
SkiaFontCollection class >> primRelease: aHandle [
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_font_collection_drop(void** aHandle))
]

{ #category : #'api - font collection' }
SkiaFontCollection >> defaultFontManager: aSkiaFontManager [
	self primSetDefaultFontManager: aSkiaFontManager
]

{ #category : #'private - ffi' }
SkiaFontCollection >> primSetDefaultFontManager: aSkiaFontManager [
	self ffiCall: #(void skia_font_collection_set_default_font_manager(self, SkiaFontManager aSkiaFontManager))
]

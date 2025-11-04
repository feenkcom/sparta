Class {
	#name : #SkiaTextBlob,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaTextBlob class >> glyphs: aByteArray font: aSkiaFont [
	<return: #SkiaTextBlob>	
	
	^ self fromNativeHandle: (self primNewFromGlyphs: aByteArray length: aByteArray size // 2 font: aSkiaFont)
]

{ #category : #'instance creation' }
SkiaTextBlob class >> glyphs: aByteArray font: aSkiaFont during: aBlock [
	^ self fromNativeHandle: (self
		primNewFromGlyphs: aByteArray
		length: aByteArray size // 2
		font: aSkiaFont)
	during: aBlock
]

{ #category : #'private - ffi' }
SkiaTextBlob class >> primCreate [
	^ self ffiCall: #(void* skia_text_blob_default())
]

{ #category : #'private - ffi' }
SkiaTextBlob class >> primNewFromGlyphs: aByteArray length: anAmountOfU16Glyphs font: aSkiaFont [
	"glyphs from aByteArray are copied into the text blob"
	^ self ffiBareCall: #(void* skia_text_blob_from_glyphs(
		void* aByteArray,
		size_t anAmountOfU16Glyphs,
		SkiaFont aSkiaFont ))
]

{ #category : #'private - ffi' }
SkiaTextBlob class >> primNewFromText: aGtBoxerString encoding: aSkiaTextEncoding font: aSkiaFont [
	^ self ffiCall: #(void* skia_text_blob_from_text(
		GtBoxerString aGtBoxerString,
		SkiaTextEncoding aSkiaTextEncoding,
		SkiaFont aSkiaFont ))
]

{ #category : #'private - ffi' }
SkiaTextBlob class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_text_blob_drop(void* aHandle))
]

{ #category : #'instance creation' }
SkiaTextBlob class >> string: aString font: aSkiaFont [
	<return: #SkiaTextBlob>

	^ self ffiLibrary
		newString: aString
		during: [ :aStringBox | self text: aStringBox font: aSkiaFont ]
]

{ #category : #'instance creation' }
SkiaTextBlob class >> string: aString font: aSkiaFont during: aBlock [	
	
	^ self ffiLibrary
		newString: aString
		during: [ :aStringBox | self text: aStringBox font: aSkiaFont during: aBlock ]
]

{ #category : #'instance creation' }
SkiaTextBlob class >> text: aGtBoxerString font: aSkiaFont [
	<return: #SkiaTextBlob>
	
	^ self fromNativeHandle: (self primNewFromText: aGtBoxerString encoding: SkiaTextEncoding UTF8 font: aSkiaFont)
]

{ #category : #'instance creation' }
SkiaTextBlob class >> text: aGtBoxerString font: aSkiaFont during: aBlock [
	^ self
		fromNativeHandle: (self primNewFromText: aGtBoxerString encoding: SkiaTextEncoding UTF8 font: aSkiaFont)
		during: aBlock
]

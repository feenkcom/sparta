Class {
	#name : #SkiaTextBlob,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaTextBlob class >> primCreate [
	^ self ffiCall: #(void* skia_text_blob_default())
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
	| aBoxerString |
	
	aBoxerString := GtBoxerString fromString: aString.
	^ [ self text: aBoxerString font: aSkiaFont ]
		ensure: [ aBoxerString release ]
]

{ #category : #'instance creation' }
SkiaTextBlob class >> text: aGtBoxerString font: aSkiaFont [
	^ self fromNativeHandle: (self primNewFromText: aGtBoxerString encoding: SkiaTextEncoding UTF8 font: aSkiaFont)
]
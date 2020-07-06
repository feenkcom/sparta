Class {
	#name : #SkiaBitmapBuilder,
	#superclass : #SpartaBitmapBuilder,
	#classInstVars : [
		'session',
		'formCache'
	],
	#category : #'Sparta-Skia-Builders'
}

{ #category : #cleanup }
SkiaBitmapBuilder class >> cleanUp [
	super cleanUp.
	
	formCache := nil.
	session := nil
]

{ #category : #accessing }
SkiaBitmapBuilder class >> defaultFormCache [
	^ SpartaFormCache new
		maximumWeight: 100 "how many different forms we cache";
		yourself
]

{ #category : #accessing }
SkiaBitmapBuilder class >> formCache [

	session == Smalltalk session
		ifFalse: [
			formCache := nil.
			session := Smalltalk session ].

	^ formCache ifNil: [ formCache := self defaultFormCache ]
]

{ #category : #bitmap }
SkiaBitmapBuilder >> fromBGR: aData extent: anExtent stride: aStride [
	^ SkiaImage fromBGR: aData extent: anExtent stride: aStride
]

{ #category : #bitmap }
SkiaBitmapBuilder >> fromBGRA: aData extent: anExtent stride: aStride [
	^ SkiaImage fromBGRA: aData extent: anExtent stride: aStride
]

{ #category : #bitmap }
SkiaBitmapBuilder >> fromBuffer: aByteArray [
	"Create a bitmap surface from the supplied picture file contents"
	<return: #TSpartaSurface>

	^ SkiaImage fromBuffer: aByteArray start: 0 end: aByteArray size - 1.
]

{ #category : #bitmap }
SkiaBitmapBuilder >> fromFileNamed: aString [
	"Create a bitmap surface from a picture file with a given path"
	<return: #TSpartaSurface>

	^ SkiaImage fromFile: aString 
]

{ #category : #bitmap }
SkiaBitmapBuilder >> fromForm: aForm [
	"Create a bitmap surface from a given Form"
	<return: #TSpartaSurface>

	^ self class formCache
		at: aForm
		ifAbsentPut: [ SkiaImage fromForm: aForm ]
]

{ #category : #bitmap }
SkiaBitmapBuilder >> fromGray: aData extent: anExtent stride: aStride [
	^ SkiaImage fromGray: aData extent: anExtent stride: aStride
]

{ #category : #bitmap }
SkiaBitmapBuilder >> fromRGBA: aData extent: anExtent stride: aStride [
	^ SkiaImage fromRGBA: aData extent: anExtent stride: aStride
]

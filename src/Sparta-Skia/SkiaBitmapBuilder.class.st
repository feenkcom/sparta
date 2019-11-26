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
SkiaBitmapBuilder >> fromForm: aForm [
	"Create a bitmap surface from a given Form"
	<return: #TSpartaSurface>

	^ self class formCache
		at: aForm
		ifAbsentPut: [ SkiaImage fromForm: aForm ]
]

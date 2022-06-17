Class {
	#name : #SkiaTypefaceFontProvider,
	#superclass : #SkiaExternalObject,
	#instVars : [
		'typefaces'
	],
	#classInstVars : [
		'uniqueInstance',
		'session'
	],
	#category : #'Sparta-Skia-External'
}

{ #category : #accessing }
SkiaTypefaceFontProvider class >> default [
	^ (uniqueInstance isNotNil and: [ session == Smalltalk session ])
		ifTrue: [ uniqueInstance ]
		ifFalse: [
			session := Smalltalk session.
			uniqueInstance := self new ]
]

{ #category : #'private - ffi' }
SkiaTypefaceFontProvider class >> primCreate [
	^ self ffiCall: #(void* skia_typeface_font_provider_new())
]

{ #category : #'private - ffi' }
SkiaTypefaceFontProvider class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_typeface_font_provider_drop(void** aHandle))
]

{ #category : #initialization }
SkiaTypefaceFontProvider >> initialize [
	super initialize.
	
	typefaces := OrderedCollection new
]

{ #category : #'private - ffi' }
SkiaTypefaceFontProvider >> primRegisterTypeface: aSkiaTypeface [
	^ self ffiCall: #(size_t skia_typeface_font_provider_register_typeface(
		self,
		SkiaTypeface aSkiaTypeface))
]

{ #category : #'api - font provider' }
SkiaTypefaceFontProvider >> registerTypeface: aTypeface [
	self primRegisterTypeface: aTypeface.
	typefaces add: aTypeface
]

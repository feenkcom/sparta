Class {
	#name : #MozUserFontEntry,
	#superclass : #FFIExternalObject,
	#traits : 'TMozLibrary + TMozInlineRefPtr + TMozDebug',
	#classTraits : 'TMozLibrary classTrait + TMozInlineRefPtr classTrait + TMozDebug classTrait',
	#instVars : [
		'fontFace',
		'buffer'
	],
	#category : 'Sparta-Moz2D-Text'
}

{ #category : #'private - ffi' }
MozUserFontEntry class >> primRelease: aHandle [

	^ self ffiCall: #(void moz2d_font_user_entry_release(void* aHandle))
]

{ #category : #comparing }
MozUserFontEntry >> = anotherObject [
	self == anotherObject
		ifTrue: [ ^ true ].
	(anotherObject isKindOf: self class)
		ifFalse: [ ^ false ].

	^ anotherObject getHandle getHandle = self getHandle getHandle
		and: [ anotherObject name = self name
			and: [ anotherObject source = self source ] ]
			
]

{ #category : #accessing }
MozUserFontEntry >> buffer [
	^ buffer
]

{ #category : #accessing }
MozUserFontEntry >> buffer: anObject [
	buffer := anObject
]

{ #category : #accessing }
MozUserFontEntry >> fontFace [
	^ fontFace
]

{ #category : #accessing }
MozUserFontEntry >> fontFace: anObject [
	fontFace := anObject
]

{ #category : #comparing }
MozUserFontEntry >> hash [
	^ (self name hash bitXor: self getHandle getHandle hash) bitXor: self source hash
]

{ #category : #actions }
MozUserFontEntry >> load [
	self primLoad
]

{ #category : #accessing }
MozUserFontEntry >> name [
	^ self fontFace familyName
]

{ #category : #'private - ffi' }
MozUserFontEntry >> primLoad [

	^ self ffiCall: #(void moz2d_font_user_entry_load (self))
]

{ #category : #'private - ffi' }
MozUserFontEntry >> primLoadState [

	^ self ffiCall: #(MozUserFontLoadState moz2d_font_user_entry_get_load_state (self))
]

{ #category : #accessing }
MozUserFontEntry >> source [
	^ self fontFace source
]

{ #category : #accessing }
MozUserFontEntry >> state [
	^ self primLoadState
]

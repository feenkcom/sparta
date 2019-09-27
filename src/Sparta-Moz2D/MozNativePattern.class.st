"
I represent a mozilla::gfx::Pattern structure.

This is the base class for 'patterns'. Patterns describe the pixels used as the source for a masked composition operation that is done by the different drawing commands.
These objects are not backend specific, however for example the gradient stops on a gradient pattern can be backend specific.

Public API and Key Messages

- asForm - to render a preview of me on sparta canavas

Internal Representation and Key Implementation Points.

	I am sent by value to all DrawTarget methods therefore need to be freed when not needed
"
Class {
	#name : #MozNativePattern,
	#superclass : #FFIExternalObject,
	#traits : 'TMozLibrary + TMozPlainPtr + TMozDebug + TSpartaInspectorPreview',
	#classTraits : 'TMozLibrary classTrait + TMozPlainPtr classTrait + TMozDebug classTrait + TSpartaInspectorPreview classTrait',
	#category : 'Sparta-Moz2D-External'
}

{ #category : #'private - ffi' }
MozNativePattern class >> primRelease: aHandle [

	^ self ffiCall: #(void moz2d_pattern_delete (void* aHandle) )
]

{ #category : #converting }
MozNativePattern >> asForm [
	| aCanvas |

	aCanvas := MozCanvas checker: 200@200.
	aCanvas fill
		paint: self;
		path: aCanvas bounds;
		draw.

	^ aCanvas asForm
]

{ #category : #converting }
MozNativePattern >> asMozPatternOn: aCanvas [
	^ self
]

{ #category : #converting }
MozNativePattern >> asSpartaPaintOn: aSpartaCanvas [
	^ self
]

{ #category : #dispatch }
MozNativePattern >> spartaFillPath: aPath with: aFillPainter [
	aFillPainter fillPath: aPath withPattern: self
]

{ #category : #dispatch }
MozNativePattern >> spartaFillRectangle: aRectangle with: aFillPainter [
	aFillPainter fillRectangle: aRectangle withPattern: self
]

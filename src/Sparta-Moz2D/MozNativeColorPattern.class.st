"
I represent a mozilla::gfx::ColorPattern structure.

This class is used for Color Patterns. This class itself may be used on the stack.

Public API and Key Messages

	MozNativeColorPattern fromColor: (Color red alpha: 0.5)
"
Class {
	#name : #MozNativeColorPattern,
	#superclass : #MozNativePattern,
	#category : 'Sparta-Moz2D-External'
}

{ #category : #'instance creation' }
MozNativeColorPattern class >> fromColor: aColor [

	^ (self
		primColorPatternR: aColor red
		g: aColor green
		b: aColor blue
		a: aColor alpha) autoRelease
]

{ #category : #'private - ffi' }
MozNativeColorPattern class >> primColorPatternR: r g: g b: b a: a [

	^ self ffiCall: #( MozNativeColorPattern moz2d_pattern_color_create_rgba(float r, float g, float b, float a ) )
]

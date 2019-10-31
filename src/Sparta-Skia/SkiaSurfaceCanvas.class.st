Class {
	#name : #SkiaSurfaceCanvas,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaSurfaceCanvas class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_canvas_drop(void* aHandle))
]

{ #category : #'api - drawing' }
SkiaSurfaceCanvas >> drawColor: aColor [
	self drawColor: aColor blendMode: SkiaBlendMode SrcOver
]

{ #category : #'api - drawing' }
SkiaSurfaceCanvas >> drawColor: aColor blendMode: aBlendMode [
	| aRed aGreen aBlue anAlpha |

	aRed := (aColor red * 255) asInteger.
	aGreen := (aColor green * 255) asInteger.
	aBlue := (aColor blue * 255) asInteger.
	anAlpha := (aColor alpha * 255) asInteger.
	
	self
		assert: [ aRed isInteger and: [ aRed between: 0 and: 255 ] ]
		description: [ 'Red must uint8 integer' ].

	self
		assert: [ aGreen isInteger and: [ aGreen between: 0 and: 255 ] ]
		description: [ 'Green must uint8 integer' ].
	
	self
		assert: [ aBlue isInteger and: [ aBlue between: 0 and: 255 ] ]
		description: [ 'Blue must uint8 integer' ].
	
	self
		assert: [ anAlpha isInteger and: [ anAlpha between: 0 and: 255 ] ]
		description: [ 'Alpha must uint8 integer' ].

	self primDrawColorR: aRed g: aGreen b: aBlue a: anAlpha blendMode: aBlendMode
]

{ #category : #'private - ffi' }
SkiaSurfaceCanvas >> primDrawColorR: r g: g b: b a: a blendMode: aBlendMode [
	^ self ffiCall: #(void skia_canvas_draw_color(self,
		uint8 r, uint8 g, uint8 b, uint8 a,
		SkiaBlendMode aBlendMode))
]

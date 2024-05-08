Class {
	#name : #SkiaSvgSurface,
	#superclass : #SkiaSurface,
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaSvgSurface class >> bounds: aRectangle during: aBlock [
	^ self
		fromNativeHandle: (self
			primNewLeft: aRectangle left
			top: aRectangle top
			width: aRectangle width
			height: aRectangle height
			flags: 1)
		during: aBlock
]

{ #category : #'private - ffi' }
SkiaSvgSurface class >> primNewLeft: aLeft top: aTop width: aWidth height: aHeight flags: flagsNumber [
	self ffiCall: #(void* skia_svg_canvas_new(
		scalar aLeft,
		scalar aTop,
		scalar aWidth,
		scalar aHeight,
		uint32 flagsNumber))
]

{ #category : #'private - ffi' }
SkiaSvgSurface class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_svg_canvas_drop(void* aHandle))
]

{ #category : #accessing }
SkiaSvgSurface >> canvas [
	<return: #SkiaSurfaceCanvas>
	| aCanvas |

	aCanvas := SkiaSurfaceCanvas fromNativeHandle: self primGetCanvas.
	aCanvas surface: self.
	^ aCanvas
]

{ #category : #accessing }
SkiaSvgSurface >> end [
	<return: #String>

	^ self ffiLibrary
		getStringFrom: [ :aBoxerString | self primEnd: aBoxerString ]
]

{ #category : #'private - ffi' }
SkiaSvgSurface >> primEnd: aStringBox [
	^ self ffiCall: #(void* skia_svg_canvas_end(self, void* aStringBox))
]

{ #category : #'private - ffi' }
SkiaSvgSurface >> primGetCanvas [
	^ self ffiCall: #(void* skia_svg_canvas_get_canvas(self))
]

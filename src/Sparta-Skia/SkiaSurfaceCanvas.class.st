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

{ #category : #'api - clip' }
SkiaSurfaceCanvas >> clipDeviceBounds [
	<return: #Rectangle>
	| aRectangleI32 |
	
	aRectangleI32 := SkiaRectangleI32 new.
	self primClipGetDeviceBounds: aRectangleI32.
	^ aRectangleI32 asRectangle
]

{ #category : #'api - clip' }
SkiaSurfaceCanvas >> clipLocalBounds [
	<return: #Rectangle>
	| aRectangleF32 |
	
	aRectangleF32 := SkiaRectangleF32 new.
	self primClipGetLocalBounds: aRectangleF32.
	^ aRectangleF32 asRectangle
]

{ #category : #'api - clip' }
SkiaSurfaceCanvas >> clipPath: aSkiaPath [
	self
		clipPath: aSkiaPath
		clipOp: SkiaClipOp Intersect
		antiAlias: true
]

{ #category : #'api - clip' }
SkiaSurfaceCanvas >> clipPath: aSkiaPath clipOp: aSkiaClipOp antiAlias: isAntiAlias [
	self
		primClipPath: aSkiaPath
		clipOp: aSkiaClipOp
		antiAlias: isAntiAlias
]

{ #category : #'api - clip' }
SkiaSurfaceCanvas >> clipRectangle: aSpartaRectangle [
	self
		clipRectangle: aSpartaRectangle
		clipOp: SkiaClipOp Intersect
		antiAlias: true
]

{ #category : #'api - clip' }
SkiaSurfaceCanvas >> clipRectangle: aSpartaRectangle clipOp: aSkiaClipOp antiAlias: isAntiAlias [
	self
		primClipRectangleLeft: aSpartaRectangle left top: aSpartaRectangle top right: aSpartaRectangle right bottom: aSpartaRectangle bottom
		clipOp: aSkiaClipOp
		antiAlias: isAntiAlias
]

{ #category : #'api - drawing' }
SkiaSurfaceCanvas >> drawCircle: aSpartaCircle paint: aSkiaPaint [
	self
		primDrawCircleX: aSpartaCircle center x y: aSpartaCircle center y
		radius: aSpartaCircle radius
		paint: aSkiaPaint
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

{ #category : #'api - drawing' }
SkiaSurfaceCanvas >> drawLine: aSpartaLine paint: aSkiaPaint [	
	self
		primDrawLineFromX: aSpartaLine from x y: aSpartaLine from y
		toX: aSpartaLine to x y: aSpartaLine to y
		paint: aSkiaPaint
]

{ #category : #'api - drawing' }
SkiaSurfaceCanvas >> drawOval: aSpartaRectangle paint: aSkiaPaint [	
	self
		primDrawOvalLeft: aSpartaRectangle left top: aSpartaRectangle top right: aSpartaRectangle right bottom: aSpartaRectangle bottom
		paint: aSkiaPaint
]

{ #category : #'api - drawing' }
SkiaSurfaceCanvas >> drawPaint: aSkiaPaint [
	self primDrawPaint: aSkiaPaint
]

{ #category : #'api - drawing' }
SkiaSurfaceCanvas >> drawPath: aSkiaPath paint: aSkiaPaint [
	self primDrawPath: aSkiaPath paint: aSkiaPaint
]

{ #category : #'api - drawing' }
SkiaSurfaceCanvas >> drawPoint: aPoint paint: aSkiaPaint [
	self
		primDrawPointX: aPoint x
		y: aPoint y
		paint: aSkiaPaint
]

{ #category : #'api - drawing' }
SkiaSurfaceCanvas >> drawRectangle: aSpartaRectangle paint: aSkiaPaint [	
	self
		primDrawRectangleLeft: aSpartaRectangle left top: aSpartaRectangle top right: aSpartaRectangle right bottom: aSpartaRectangle bottom
		paint: aSkiaPaint
]

{ #category : #'api - state' }
SkiaSurfaceCanvas >> flush [
	self primFlush
]

{ #category : #'private - ffi' }
SkiaSurfaceCanvas >> primClipGetDeviceBounds: aSkiaRectangleI32 [
	self ffiCall: #(void skia_canvas_device_clip_bounds(self, SkiaRectangleI32 aSkiaRectangleI32))
]

{ #category : #'private - ffi' }
SkiaSurfaceCanvas >> primClipGetLocalBounds: aSkiaRectangleF32 [
	self ffiCall: #(void skia_canvas_local_clip_bounds(self, SkiaRectangleF32 aSkiaRectangleF32))
]

{ #category : #'private - ffi' }
SkiaSurfaceCanvas >> primClipPath: aSkiaPath clipOp: aSkiaClipOp antiAlias: isAntiAlias [
	self ffiCall: #(void skia_canvas_clip_path(self,
		SkiaPath aSkiaPath,
		SkiaClipOp aSkiaClipOp,
		bool isAntiAlias))
]

{ #category : #'private - ffi' }
SkiaSurfaceCanvas >> primClipRectangleLeft: aLeft top: aTop right: aRight bottom: aBottom clipOp: aSkiaClipOp antiAlias: isAntiAlias [
	self ffiCall: #(void skia_canvas_clip_rect(self,
		scalar aLeft, scalar aTop, scalar aRight, scalar aBottom,
		SkiaClipOp aSkiaClipOp,
		bool isAntiAlias))
]

{ #category : #'private - ffi' }
SkiaSurfaceCanvas >> primDrawCircleX: aX y: aY radius: aRadius paint: aSkiaPaint [
	self ffiCall: #(void skia_canvas_draw_circle(self,
		scalar aX, scalar aY, scalar aRadius,
		SkiaPaint aSkiaPaint))
]

{ #category : #'private - ffi' }
SkiaSurfaceCanvas >> primDrawColorR: r g: g b: b a: a blendMode: aBlendMode [
	^ self ffiCall: #(void skia_canvas_draw_color(self,
		uint8 r, uint8 g, uint8 b, uint8 a,
		SkiaBlendMode aBlendMode))
]

{ #category : #'private - ffi' }
SkiaSurfaceCanvas >> primDrawLineFromX: aFromX y: aFromY toX: aToX y: aToY paint: aSkiaPaint [
	self ffiCall: #(void skia_canvas_draw_line(self, scalar aFromX, scalar aFromY, scalar aToX, scalar aToY, SkiaPaint aSkiaPaint))
]

{ #category : #'private - ffi' }
SkiaSurfaceCanvas >> primDrawOvalLeft: aLeft top: aTop right: aRight bottom: aBottom paint: aSkiaPaint [
	self ffiCall: #(void skia_canvas_draw_oval(self,
		scalar aLeft, scalar aTop, scalar aRight, scalar aBottom,
		SkiaPaint aSkiaPaint))
]

{ #category : #'private - ffi' }
SkiaSurfaceCanvas >> primDrawPaint: aSkiaPaint [
	self ffiCall: #(void skia_canvas_draw_paint(self, SkiaPaint aSkiaPaint))
]

{ #category : #'private - ffi' }
SkiaSurfaceCanvas >> primDrawPath: aSkiaPath paint: aSkiaPaint [
	self ffiCall: #(void skia_canvas_draw_path(self, SkiaPath aSkiaPath, SkiaPaint aSkiaPaint))
]

{ #category : #'private - ffi' }
SkiaSurfaceCanvas >> primDrawPointX: aX y: aY paint: aSkiaPaint [
	self ffiCall: #(void skia_canvas_draw_point(self, scalar aX, scalar aY, SkiaPaint aSkiaPaint))
]

{ #category : #'private - ffi' }
SkiaSurfaceCanvas >> primDrawRectangleLeft: aLeft top: aTop right: aRight bottom: aBottom paint: aSkiaPaint [
	self ffiCall: #(void skia_canvas_draw_rectangle(self,
		scalar aLeft, scalar aTop, scalar aRight, scalar aBottom,
		SkiaPaint aSkiaPaint))
]

{ #category : #'private - ffi' }
SkiaSurfaceCanvas >> primFlush [
	self ffiCall: #(void skia_canvas_flush(self))
]

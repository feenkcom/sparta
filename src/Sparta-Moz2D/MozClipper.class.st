Class {
	#name : #MozClipper,
	#superclass : #SpartaClipper,
	#traits : 'TMozLibrary',
	#classTraits : 'TMozLibrary classTrait',
	#category : 'Sparta-Moz2D-Builders'
}

{ #category : #testing }
MozClipper >> containsGlobal: aRectangle [
	^ self
		primContainsGlobalX: aRectangle left
		y: aRectangle top
		width: aRectangle width
		height: aRectangle height
]

{ #category : #testing }
MozClipper >> containsLocal: aRectangle [
	^ self
		primContainsLocalX: aRectangle left asFloat
		y: aRectangle top asFloat
		width: aRectangle width asFloat
		height: aRectangle height asFloat
]

{ #category : #geometry }
MozClipper >> globalBounds [
	|externalRectangle|
	externalRectangle := MozNativeRect new.
	self primGetClipGlobal: externalRectangle.
	^ externalRectangle asRectangle
]

{ #category : #geometry }
MozClipper >> localBounds [
	|externalRectangle|
	externalRectangle := MozNativeRect new.
	self primGetClipLocal: externalRectangle.
	^ externalRectangle asRectangle
]

{ #category : #clipping }
MozClipper >> pop [

	self primPopClip
]

{ #category : #'private - ffi' }
MozClipper >> primContainsGlobalX: x y: y width: width height: height [

	^ self ffiCall: #(bool moz2d_draw_target_clipping_is_in_global (
		MozCanvas canvas,
		float x,
		float y,
		float width,
		float height ) )
]

{ #category : #'private - ffi' }
MozClipper >> primContainsLocalX: x y: y width: width height: height [

	^ self ffiCall: #(bool moz2d_draw_target_clipping_is_in_local (
		MozCanvas canvas,
		float x,
		float y,
		float width,
		float height ) )
]

{ #category : #'private - ffi' }
MozClipper >> primGetClipGlobal: aRectangle [

	^ self ffiCall: #(void moz2d_draw_target_clipping_bounds_global (MozCanvas canvas, MozNativeRect aRectangle))
]

{ #category : #'private - ffi' }
MozClipper >> primGetClipLocal: aRectangle [

	^ self ffiCall: #(void moz2d_draw_target_clipping_bounds_local (MozCanvas canvas, MozNativeRect aRectangle))
]

{ #category : #'private - ffi' }
MozClipper >> primPopClip [

	^ self ffiCall: #(void moz2d_draw_target_pop_clip ( MozCanvas canvas ))
]

{ #category : #'private - ffi' }
MozClipper >> primPushClipPath: aPath [

	^ self ffiCall: #(void moz2d_draw_target_push_clip_path (
		MozCanvas canvas,
		MozPath aPath ))
]

{ #category : #'private - ffi' }
MozClipper >> primPushClipRectangleX: x y: y width: width height: height [

	^ self ffiCall: #(void moz2d_draw_target_push_clip_rectangle (
		MozCanvas canvas,
		float x,
		float y,
		float width,
		float height ))
]

{ #category : #clipping }
MozClipper >> pushPath: aPath [

	self primPushClipPath: aPath
]

{ #category : #clipping }
MozClipper >> pushRectangle: aRectangle [
	self
		primPushClipRectangleX: aRectangle left
		y: aRectangle top
		width: aRectangle width
		height: aRectangle height
]

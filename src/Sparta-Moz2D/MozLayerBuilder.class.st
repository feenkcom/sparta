Class {
	#name : #MozLayerBuilder,
	#superclass : #SpartaLayerBuilder,
	#traits : 'TMozLibrary',
	#classTraits : 'TMozLibrary classTrait',
	#category : 'Sparta-Moz2D-Builders'
}

{ #category : #layer }
MozLayerBuilder >> pop [
	self primPopLayer
]

{ #category : #'private - ffi' }
MozLayerBuilder >> primPopLayer [

	^ self ffiCall: #(void moz2d_draw_target_pop_layer ( MozCanvas canvas ) )
]

{ #category : #'private - ffi' }
MozLayerBuilder >> primPushLayer: aMask opaque: anOpaque alpha: anOpacity copy: isCopyBackground a11: a11 a12: a12 a21: a21 a22: a22 a31: a31 a32: a32 x: x y: y width: width height: height [

	^ self ffiCall: #(void moz2d_draw_target_push_layer(
		MozCanvas canvas,
		bool anOpaque,
		float anOpacity,
		ExternalAddress aMask,
		float a11,
		float a12,
		float a21,
		float a22,
		float a31,
		float a32,
		int32 x,
		int32 y,
		int32 width,
		int32 height,
		bool isCopyBackground ))
]

{ #category : #layer }
MozLayerBuilder >> push [

	self
		primPushLayer: (mask ifNotNil: #getHandle ifNil: [ ExternalAddress null ])
		opaque: isOpaque
		alpha: alpha
		copy: shouldCopy
		a11: transformation sx
		a12: transformation shy
		a21: transformation shx
		a22: transformation sy
		a31: transformation x
		a32: transformation y
		x: (area ifNotNil: #left ifNil: 0)
		y: (area ifNotNil: #top ifNil: 0)
		width: (area ifNotNil: #width ifNil: 0)
		height: (area ifNotNil: #height ifNil: 0)
]

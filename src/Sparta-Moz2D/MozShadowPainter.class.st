Class {
	#name : #MozShadowPainter,
	#superclass : #SpartaShadowPainter,
	#traits : 'TMozLibrary',
	#classTraits : 'TMozLibrary classTrait',
	#category : #'Sparta-Moz2D-Builders'
}

{ #category : #drawing }
MozShadowPainter >> draw [
	self
		primDrawShadow: source surface
		destX: destination x
		destY: destination y
		r: color red
		g: color green
		b: color blue
		a: color alpha
		offsetX: offset x
		offsetY: offset y
		sigma: sigma
		composition: MozCompositionOp OP_OVER
]

{ #category : #'private - ffi' }
MozShadowPainter >> primDrawShadow: aSurface destX: destX destY: destY r: r g: g b: b a: a offsetX: offsetX offsetY: offsetY sigma: aSigma composition: aOperator [
	^ self ffiCall: #(void moz2d_draw_target_draw_surface_with_shadow(
		MozCanvas canvas,
		MozSurface aSurface,
		float destX, float destY,
		float r, float g, float b, float a,
		float offsetX, float offsetY,
		float aSigma,
		MozCompositionOp aOperator))
]

Class {
	#name : #SkiaCompositorFilter,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'instance creation' }
SkiaCompositorFilter class >> blur: aNumberOrPoint [
	| aSigma |
	aSigma := aNumberOrPoint asPoint.
	^ self
		blurSigmaX: aSigma x
		sigmaY: aSigma y
]

{ #category : #'instance creation' }
SkiaCompositorFilter class >> blur: aNumberOrPoint during: aBlock [
	| aSigma |
	aSigma := aNumberOrPoint asPoint.
	^ self
		blurSigmaX: aSigma x
		sigmaY: aSigma y
		during: aBlock
]

{ #category : #'instance creation' }
SkiaCompositorFilter class >> blurSigmaX: aSigmaX sigmaY: aSigmaY [
	^ self fromNativeHandle: (self primBlurSigmaX: aSigmaX sigmaY: aSigmaY)
]

{ #category : #'instance creation' }
SkiaCompositorFilter class >> blurSigmaX: aSigmaX sigmaY: aSigmaY during: aBlock [
	^ self
		fromNativeHandle: (self primBlurSigmaX: aSigmaX sigmaY: aSigmaY)
		during: aBlock
]

{ #category : #'private - ffi' }
SkiaCompositorFilter class >> primBlurSigmaX: aSigmaX sigmaY: aSigmaY [
	^ self ffiCall: #(void* compositor_filter_blur_new(float32 aSigmaX, float32 aSigmaY))
]

{ #category : #'private - ffi' }
SkiaCompositorFilter class >> primRelease: aHandle [
	self ffiCall: #(void compositor_filter_drop(void* aHandle))
]

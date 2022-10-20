Class {
	#name : #SkiaCompositorLeftoverCommand,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'instance creation' }
SkiaCompositorLeftoverCommand class >> clip: aCompositorGeometry offset: anOffsetPoint during: aBlock [
	^ self
		fromNativeHandle: (self primNewClip: aCompositorGeometry offsetX: anOffsetPoint x offsetY: anOffsetPoint y)
		during: aBlock
]

{ #category : #'private - ffi' }
SkiaCompositorLeftoverCommand class >> primNewClip: aCompositorGeometry offsetX: anOffsetX offsetY: anOffsetY [
	^ self ffiCall: #(void* compositor_leftover_clip_command(SkiaCompositorGeometry aCompositorGeometry, float32 anOffsetX, float32 anOffsetY))
]

{ #category : #'private - ffi' }
SkiaCompositorLeftoverCommand class >> primNewTransform: aCompositorMatrix offsetX: anOffsetX offsetY: anOffsetY [
	^ self ffiCall: #(void* compositor_leftover_transform_command(SkiaCompositorMatrix aCompositorMatrix, float32 anOffsetX, float32 anOffsetY))
]

{ #category : #'private - ffi' }
SkiaCompositorLeftoverCommand class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void compositor_leftover_command_drop(void* aHandle))
]

{ #category : #'instance creation' }
SkiaCompositorLeftoverCommand class >> transform: aSpartaMatrix offset: anOffsetPoint during: aBlock [
	^ SkiaCompositorMatrix
		matrix: aSpartaMatrix
		during: [ :aCompositorMatrix |
			self
				fromNativeHandle: (self
					primNewTransform: aCompositorMatrix
					offsetX: anOffsetPoint x
					offsetY: anOffsetPoint y)
				during: aBlock ]
]

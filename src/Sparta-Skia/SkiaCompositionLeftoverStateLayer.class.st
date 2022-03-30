Class {
	#name : #SkiaCompositionLeftoverStateLayer,
	#superclass : #SkiaCompositionLayer,
	#instVars : [
		'offset'
	],
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #accessing }
SkiaCompositionLeftoverStateLayer class >> commands: theLeftoverCommands [
	^ self fromNativeHandle: (self primCreate: theLeftoverCommands)
]

{ #category : #'private - ffi' }
SkiaCompositionLeftoverStateLayer class >> primCreate: theLeftoverCommands [
	^ self ffiCall: #(void* compositor_leftover_layer_new(SkiaCompositorLeftoverCommands theLeftoverCommands))
]

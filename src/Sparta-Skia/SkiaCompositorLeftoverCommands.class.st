Class {
	#name : #SkiaCompositorLeftoverCommands,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'private - ffi' }
SkiaCompositorLeftoverCommands class >> primCreate [
	^ self ffiCall: #(void* compositor_leftover_commands_new())
]

{ #category : #'private - ffi' }
SkiaCompositorLeftoverCommands class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void compositor_leftover_commands_drop(void** aHandle))
]

{ #category : #adding }
SkiaCompositorLeftoverCommands >> add: aLeftoverCommand [
	self primAdd: aLeftoverCommand
]

{ #category : #'private - ffi' }
SkiaCompositorLeftoverCommands >> primAdd: aLeftoverCommand [
	self ffiCall: #(void compositor_leftover_commands_add(self, SkiaCompositorLeftoverCommand aLeftoverCommand))
]

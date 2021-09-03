Class {
	#name : 'SkiaShader',
	#superclass : 'SkiaExternalObject',
	#category : 'Sparta-Skia-External'
}

{ #category : 'private - ffi' }
SkiaShader class >> primCreate [
	^ self ffiCall: #(void* skia_shader_create_empty())
]

{ #category : 'private - ffi' }
SkiaShader class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_shader_drop(void** aHandle))
]

{ #category : 'gt-extension' }
SkiaShader >> gtInfoFor: aView [
	<gtView>

	^ ({
		#isImage -> self isImage.
		#isOpaque -> self isOpaque.
	 } asOrderedDictionary gtItemsFor: aView)
			title: 'Info';
			priority: 2
]

{ #category : 'testing' }
SkiaShader >> isImage [
	^ self primIsImage
]

{ #category : 'testing' }
SkiaShader >> isOpaque [
	^ self primIsOpaque
]

{ #category : 'private - ffi' }
SkiaShader >> primIsImage [
	^ self ffiCall: #(bool skia_shader_is_a_image(self))
]

{ #category : 'private - ffi' }
SkiaShader >> primIsOpaque [
	^ self ffiCall: #(bool skia_shader_is_opaque(self))
]

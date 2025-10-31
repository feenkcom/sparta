Class {
	#name : #SkiaRectangleF32,
	#superclass : #SkiaRectangle,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaRectangleF32 class >> primCreate [
	^ self ffiCall: #(void* skia_rectangle_f32_default())
]

{ #category : #'private - ffi' }
SkiaRectangleF32 class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_rectangle_f32_drop(void* aHandle))
]

{ #category : #'private - ffi' }
SkiaRectangleF32 >> primGetBottom [
	^ self ffiCall: #(scalar skia_rectangle_f32_bottom(self))
]

{ #category : #'private - ffi' }
SkiaRectangleF32 >> primGetLeft [
	^ self ffiCall: #(scalar skia_rectangle_f32_left(self))
]

{ #category : #'private - ffi' }
SkiaRectangleF32 >> primGetRight [
	^ self ffiCall: #(scalar skia_rectangle_f32_right(self))
]

{ #category : #'private - ffi' }
SkiaRectangleF32 >> primGetTop [
	^ self ffiCall: #(scalar skia_rectangle_f32_top(self))
]

Class {
	#name : #SkiaRectangleI32,
	#superclass : #SkiaRectangle,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaRectangleI32 class >> primCreate [
	^ self ffiCall: #(void* skia_rectangle_i32_default())
]

{ #category : #'private - ffi' }
SkiaRectangleI32 class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_rectangle_i32_drop(void* aHandle))
]

{ #category : #'private - ffi' }
SkiaRectangleI32 >> primGetBottom [
	^ self ffiCall: #(int32 skia_rectangle_i32_bottom(self))
]

{ #category : #'private - ffi' }
SkiaRectangleI32 >> primGetLeft [
	^ self ffiCall: #(int32 skia_rectangle_i32_left(self))
]

{ #category : #'private - ffi' }
SkiaRectangleI32 >> primGetRight [
	^ self ffiCall: #(int32 skia_rectangle_i32_right(self))
]

{ #category : #'private - ffi' }
SkiaRectangleI32 >> primGetTop [
	^ self ffiCall: #(int32 skia_rectangle_i32_top(self))
]

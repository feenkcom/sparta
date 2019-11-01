Class {
	#name : #SkiaPaint,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaPaint class >> primCreate [
	^ self ffiCall: #(void* skia_paint_default())
]

{ #category : #'private - ffi' }
SkiaPaint class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_paint_drop(void* aHandle))
]

{ #category : #'private - ffi' }
SkiaPaint >> primIsAntiAlias [
	self ffiCall: #(bool skia_paint_is_anti_alias(self))
]

{ #category : #'private - ffi' }
SkiaPaint >> primIsDither [
	self ffiCall: #(bool skia_paint_is_dither(self))
]

{ #category : #'private - ffi' }
SkiaPaint >> primReset [
	self ffiCall: #(void skia_paint_reset(self))
]

{ #category : #'private - ffi' }
SkiaPaint >> primSetAntiAlias: isAntiAlias [
	self ffiCall: #(void skia_paint_set_anti_alias(self, bool isAntiAlias))
]

{ #category : #'private - ffi' }
SkiaPaint >> primSetDither: isDither [
	self ffiCall: #(void skia_paint_set_dither(self, bool isDither))
]

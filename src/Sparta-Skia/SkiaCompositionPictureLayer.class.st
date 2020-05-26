Class {
	#name : #SkiaCompositionPictureLayer,
	#superclass : #SkiaCompositionLayer,
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaCompositionPictureLayer class >> picture: aSkiaPicture [
	^ self fromNativeHandle: (self primFromPicture: aSkiaPicture)
]

{ #category : #'private - ffi' }
SkiaCompositionPictureLayer class >> primCreate [
	^ self ffiCall: #(void* skia_picture_layer_new())
]

{ #category : #'private - ffi' }
SkiaCompositionPictureLayer class >> primFromPicture: aSkiaPicture [
	^ self ffiCall: #(void* skia_picture_layer_new_picture(SkiaPicture aSkiaPicture))
]

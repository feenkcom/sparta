Class {
	#name : #SkiaImageInfo,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaImageInfo class >> primCreate [
	^ self ffiCall: #(void* skia_image_info_new_default())
]

{ #category : #'private - ffi' }
SkiaImageInfo class >> primCreateWidth: aWidth height: aHeight colorType: aColorType alphaType: anAlphaType [
	^ self ffiCall: #(void* skia_image_info_new(
		int32 aWidth,
		int32 aHeight,
		SkiaColorType aColorType,
		SkiaAlphaType anAlphaType))
]

{ #category : #'private - ffi' }
SkiaImageInfo class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_image_info_drop(void* aHandle))
]

{ #category : #'instance creation' }
SkiaImageInfo class >> width: aWidth height: aHeight colorType: aColorType alphaType: anAlphaType [
	^ self fromNativeHandle: (self primCreateWidth: aWidth height: aHeight colorType: aColorType alphaType: anAlphaType)
]

{ #category : #accessing }
SkiaImageInfo >> alphaType [
	<return: #SkiaAlphaType>

	^ self primGetAlphaType
]

{ #category : #accessing }
SkiaImageInfo >> byteSize [
	"Return the minimum amount of bytes needed for the image"
	
	^ self computeByteSize: self minRowBytes
]

{ #category : #accessing }
SkiaImageInfo >> bytesPerPixel [
	<return: #Number>
	
	^ self primGetBytesPerPixel
]

{ #category : #accessing }
SkiaImageInfo >> colorType [
	<return: #SkiaColorType>

	^ self primGetColorType
]

{ #category : #memory }
SkiaImageInfo >> computeByteSize: aRowBytes [
	<return: #Number>

	^ self primComputeByteSize: aRowBytes
]

{ #category : #'gt-extension' }
SkiaImageInfo >> gtInforFor: aView [
	<gtView>

	^ ({ 
		#width -> self width.
		#height -> self height.
		#alphaType -> self alphaType.
		#colorType -> self colorType.
		#bytesPerPixel -> self bytesPerPixel.
		#shiftPerPixel -> self shiftPerPixel.
		#minRowBytes -> self minRowBytes.
		#byteSize -> self byteSize
	 } asOrderedDictionary gtItemsFor: aView)
			title: 'Info';
			priority: 2
]

{ #category : #accessing }
SkiaImageInfo >> height [
	<return: #Number>

	^ self primGetHeight
]

{ #category : #memory }
SkiaImageInfo >> minRowBytes [
	<return: #Number>
	
	^ self primGetMinRowBytes
]

{ #category : #'private - ffi' }
SkiaImageInfo >> primComputeByteSize: anAmountOfRowBytes [
	^ self ffiCall: #(size_t skia_image_info_compute_byte_size(self, size_t anAmountOfRowBytes))
]

{ #category : #'private - ffi' }
SkiaImageInfo >> primGetAlphaType [
	^ self ffiCall: #(SkiaAlphaType skia_image_info_get_alpha_type(self))
]

{ #category : #'private - ffi' }
SkiaImageInfo >> primGetBytesPerPixel [
	^ self ffiCall: #(size_t skia_image_info_get_bytes_per_pixel(self))
]

{ #category : #'private - ffi' }
SkiaImageInfo >> primGetColorType [
	^ self ffiCall: #(SkiaColorType skia_image_info_get_color_type(self))
]

{ #category : #'private - ffi' }
SkiaImageInfo >> primGetHeight [
	^ self ffiCall: #(int32 skia_image_info_get_height(self))
]

{ #category : #'private - ffi' }
SkiaImageInfo >> primGetMinRowBytes [
	^ self ffiCall: #(size_t skia_image_info_min_row_bytes(self))
]

{ #category : #'private - ffi' }
SkiaImageInfo >> primGetShiftPerPixel [
	^ self ffiCall: #(size_t skia_image_info_get_shift_per_pixel(self))
]

{ #category : #'private - ffi' }
SkiaImageInfo >> primGetWidth [
	^ self ffiCall: #(int32 skia_image_info_get_width(self))
]

{ #category : #printing }
SkiaImageInfo >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	super printOn: aStream.
	aStream
		nextPutAll: ' alphaType: ';
		print: self alphaType.
	aStream
		nextPutAll: ' colorType: ';
		print: self colorType.
	aStream
		nextPutAll: ' height: ';
		print: self height.
	aStream
		nextPutAll: ' width: ';
		print: self width
]

{ #category : #accessing }
SkiaImageInfo >> shiftPerPixel [
	<return: #Number>
	
	^ self primGetShiftPerPixel
]

{ #category : #accessing }
SkiaImageInfo >> width [
	<return: #Number>

	^ self primGetWidth
]

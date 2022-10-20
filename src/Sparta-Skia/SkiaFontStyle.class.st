Class {
	#name : #SkiaFontStyle,
	#superclass : #SkiaExternalObject,
	#category : 'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaFontStyle class >> primCreate [
	^ self ffiCall: #(void* skia_font_style_default())
]

{ #category : #'private - ffi' }
SkiaFontStyle class >> primNewWeight: aWeight width: aSkiaFontStyleWidth slant: aSkiaFontStyleSlant [
	^ self ffiCall: #(void* skia_font_style_new(
		int32 aWeight,
		SkiaFontStyleWidth aSkiaFontStyleWidth,
		SkiaFontStyleSlant aSkiaFontStyleSlant))
]

{ #category : #'private - ffi' }
SkiaFontStyle class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_font_style_drop(void* aHandle))
]

{ #category : #'instance creation' }
SkiaFontStyle class >> weight: aWeightNumber width: aSkiaFontStyleWidth slant: aSkiaFontStyleSlant [
	^ self fromNativeHandle: (self primNewWeight: aWeightNumber width: aSkiaFontStyleWidth slant: aSkiaFontStyleSlant)
]

{ #category : #'instance creation' }
SkiaFontStyle class >> weight: aWeightNumber width: aSkiaFontStyleWidth slant: aSkiaFontStyleSlant during: aBlock [
	^ self
		fromNativeHandle: (self
			primNewWeight: aWeightNumber
			width: aSkiaFontStyleWidth
			slant: aSkiaFontStyleSlant)
		during: aBlock
]

{ #category : #'gt-extension' }
SkiaFontStyle >> gtInfoFor: aView [
	<gtView>

	^ ({
		#slant -> self slant.
		#weight -> self weight.
		#width -> self width
	 } asOrderedDictionary gtItemsFor: aView)
			title: 'Info';
			priority: 2
]

{ #category : #'private - ffi' }
SkiaFontStyle >> primGetSlant [
	^ self ffiCall: #(SkiaFontStyleSlant skia_font_style_get_slant(self))
]

{ #category : #'private - ffi' }
SkiaFontStyle >> primGetWeight [
	^ self ffiCall: #(int32 skia_font_style_get_weight(self))
]

{ #category : #'private - ffi' }
SkiaFontStyle >> primGetWidth [
	^ self ffiCall: #(SkiaFontStyleWidth skia_font_style_get_width(self))
]

{ #category : #printing }
SkiaFontStyle >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	aStream
		nextPut: ${;
		nextPutAll: ' width: ';
		print: self width.
	aStream
		nextPutAll: ' slant: ';
		print: self slant.
	aStream
		nextPutAll: ' weight: ';
		print: self weight;
		space;
		nextPut: $}
]

{ #category : #accessing }
SkiaFontStyle >> slant [
	<return: #SkiaFontStyleSlant>

	^ self primGetSlant
]

{ #category : #accessing }
SkiaFontStyle >> weight [
	<return: #Number>

	^ self primGetWeight
]

{ #category : #accessing }
SkiaFontStyle >> width [
	<return: #Number>

	^ self primGetWidth
]

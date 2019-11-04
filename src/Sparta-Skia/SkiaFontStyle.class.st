Class {
	#name : #SkiaFontStyle,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaFontStyle class >> primCreate [
	^ self ffiCall: #(void* skia_font_style_default())
]

{ #category : #'private - ffi' }
SkiaFontStyle class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_font_style_drop(void* aHandle))
]

{ #category : #'gt-extension' }
SkiaFontStyle >> gtInforFor: aView [
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

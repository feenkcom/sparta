Class {
	#name : 'SkiaParagraphStyle',
	#superclass : 'SkiaExternalObject',
	#category : 'Sparta-Skia-External'
}

{ #category : 'private - ffi' }
SkiaParagraphStyle class >> primCreate [
	^ self ffiCall: #(void* skia_paragraph_style_new())
]

{ #category : 'private - ffi' }
SkiaParagraphStyle class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_paragraph_style_drop(void** aHandle))
]

{ #category : 'accessing' }
SkiaParagraphStyle >> height [
	^ self primGetHeight
]

{ #category : 'accessing' }
SkiaParagraphStyle >> height: aHeight [
	self primSetHeight: aHeight
]

{ #category : 'accessing' }
SkiaParagraphStyle >> maxLines [
	^ self primGetMaxLines
]

{ #category : 'accessing' }
SkiaParagraphStyle >> maxLines: aNumber [ 
	self primSetMaxLines: aNumber
]

{ #category : 'private - ffi' }
SkiaParagraphStyle >> primGetHeight [
	^ self ffiCall: #(scalar skia_paragraph_style_get_height(self))
]

{ #category : 'private - ffi' }
SkiaParagraphStyle >> primGetMaxLines [
	^ self ffiCall: #(size_t skia_paragraph_style_get_max_lines(self))
]

{ #category : 'private - ffi' }
SkiaParagraphStyle >> primGetTextStyle [
	^ self ffiCall: #(void* skia_paragraph_style_get_text_style(self))
]

{ #category : 'private - ffi' }
SkiaParagraphStyle >> primSetHeight: aHeight [
	self ffiCall: #(void skia_paragraph_style_set_height(self, scalar aHeight))
]

{ #category : 'private - ffi' }
SkiaParagraphStyle >> primSetMaxLines: anAmountOfLines [
	self ffiCall: #(void skia_paragraph_style_set_max_lines(self, size_t anAmountOfLines))
]

{ #category : 'private - ffi' }
SkiaParagraphStyle >> primSetTextStyle: aSkiaParagraphTextStyle [
	^ self ffiCall: #(void skia_paragraph_style_set_text_style(
		self,
		SkiaParagraphTextStyle aSkiaParagraphTextStyle))
]

{ #category : 'accessing' }
SkiaParagraphStyle >> textStyle [
	^ SkiaParagraphTextStyle fromNativeHandle: self primGetTextStyle
]

{ #category : 'accessing' }
SkiaParagraphStyle >> textStyle: aSkiaTextParagraphTextStyle [
	self primSetTextStyle: aSkiaTextParagraphTextStyle
]

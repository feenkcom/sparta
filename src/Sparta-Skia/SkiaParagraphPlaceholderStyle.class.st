Class {
	#name : #SkiaParagraphPlaceholderStyle,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaParagraphPlaceholderStyle class >> primCreate [
	^ self ffiCall: #(void* skia_paragraph_placeholder_style_default())
]

{ #category : #'private - ffi' }
SkiaParagraphPlaceholderStyle class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_paragraph_placeholder_style_drop(void* aHandle))
]

{ #category : #accessing }
SkiaParagraphPlaceholderStyle >> alignAboveBaseline [
	self alignment: SkiaParagraphPlaceholderAlignment AboveBaseline
]

{ #category : #accessing }
SkiaParagraphPlaceholderStyle >> alignBaseline [
	self alignment: SkiaParagraphPlaceholderAlignment Baseline
]

{ #category : #accessing }
SkiaParagraphPlaceholderStyle >> alignBelowBaseline [
	self alignment: SkiaParagraphPlaceholderAlignment BelowBaseline
]

{ #category : #accessing }
SkiaParagraphPlaceholderStyle >> alignBottom [
	self alignment: SkiaParagraphPlaceholderAlignment Bottom
]

{ #category : #accessing }
SkiaParagraphPlaceholderStyle >> alignMiddle [
	self alignment: SkiaParagraphPlaceholderAlignment Middle
]

{ #category : #accessing }
SkiaParagraphPlaceholderStyle >> alignTop [
	self alignment: SkiaParagraphPlaceholderAlignment Top
]

{ #category : #accessing }
SkiaParagraphPlaceholderStyle >> alignment: aSkiaParagraphPlaceholderAlignment [
	self primSetAlignment: aSkiaParagraphPlaceholderAlignment
]

{ #category : #accessing }
SkiaParagraphPlaceholderStyle >> baselineOffset: aBaselineOffset [
	self primSetBaselineOffset: aBaselineOffset
]

{ #category : #accessing }
SkiaParagraphPlaceholderStyle >> extent: aPoint [
	self
		width: aPoint x;
		height: aPoint y
]

{ #category : #accessing }
SkiaParagraphPlaceholderStyle >> height: aHeight [
	self primSetHeight: aHeight
]

{ #category : #'private - ffi' }
SkiaParagraphPlaceholderStyle >> primSetAlignment: aSkiaParagraphPlaceholderAlignment [
	self ffiCall: #(void skia_paragraph_placeholder_style_set_alignment(
		self,
		SkiaParagraphPlaceholderAlignment aSkiaParagraphPlaceholderAlignment))
]

{ #category : #'private - ffi' }
SkiaParagraphPlaceholderStyle >> primSetBaselineOffset: aBaselineOffset [
	self ffiCall: #(void skia_paragraph_placeholder_style_set_baseline_offset(self, scalar aBaselineOffset))
]

{ #category : #'private - ffi' }
SkiaParagraphPlaceholderStyle >> primSetHeight: aHeight [
	self ffiCall: #(void skia_paragraph_placeholder_style_set_height(self, scalar aHeight))
]

{ #category : #'private - ffi' }
SkiaParagraphPlaceholderStyle >> primSetWidth: aWidth [
	self ffiCall: #(void skia_paragraph_placeholder_style_set_width(self, scalar aWidth))
]

{ #category : #accessing }
SkiaParagraphPlaceholderStyle >> width: aWidth [
	self primSetWidth: aWidth
]

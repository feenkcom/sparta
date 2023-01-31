Class {
	#name : #SkiaParagraphBuilder,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaParagraphBuilder class >> default [
	^ self style: (SkiaParagraphStyle new
			textStyle: (SkiaParagraphTextStyle new
				color: Color black;
				fontSize: 16))
			fontCollection: SkiaFontCollection default
			tabSize: 4
]

{ #category : #'private - ffi' }
SkiaParagraphBuilder class >> primCreateStyle: aSkiaParagraphStyle fontCollection: aSkiaFontCollection tabSize: aTabSize [
	^ self ffiCall: #(void* skia_paragraph_builder_new(
		SkiaParagraphStyle aSkiaParagraphStyle,
		SkiaFontCollection aSkiaFontCollection,
		size_t aTabSize))
]

{ #category : #'private - ffi' }
SkiaParagraphBuilder class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_paragraph_builder_drop(void* aHandle))
]

{ #category : #'instance creation' }
SkiaParagraphBuilder class >> style: aSkiaParagraphStyle fontCollection: aSkiaFontCollection tabSize: aTabSize [
	^ self fromNativeHandle: (self
		primCreateStyle: aSkiaParagraphStyle
		fontCollection: aSkiaFontCollection
		tabSize: aTabSize)
]

{ #category : #'api - builder' }
SkiaParagraphBuilder >> addPlaceholder: aSkiaParagraphPlaceholderStyle charLength: aNumber [
	self primAddPlaceholder: aSkiaParagraphPlaceholderStyle charLength: aNumber
]

{ #category : #'api - builder' }
SkiaParagraphBuilder >> addString: aString [
	self ffiLibrary
		newString: aString
		during: [ :aStringBox | self primAddText: aStringBox ]
]

{ #category : #'api - builder' }
SkiaParagraphBuilder >> build [
	^ SkiaParagraph fromNativeHandle: self primBuild
]

{ #category : #'api - builder' }
SkiaParagraphBuilder >> popStyle [
	self primPopStyle
]

{ #category : #'private - ffi' }
SkiaParagraphBuilder >> primAddPlaceholder: aSkiaParagraphPlaceholderStyle charLength: aNumber [
	^ self ffiCall: #(void skia_paragraph_builder_add_placeholder(
		self,
		SkiaParagraphPlaceholderStyle aSkiaParagraphPlaceholderStyle,
		size_t aNumber))
]

{ #category : #'private - ffi' }
SkiaParagraphBuilder >> primAddText: aGtBoxerString [
	^ self ffiCall: #(void skia_paragraph_builder_add_text(self, GtBoxerString aGtBoxerString))
]

{ #category : #'private - ffi' }
SkiaParagraphBuilder >> primBuild [
	^ self ffiCall: #(void* skia_paragraph_builder_build(self))
]

{ #category : #'private - ffi' }
SkiaParagraphBuilder >> primPopStyle [
	self ffiCall: #(void skia_paragraph_builder_pop_style(self))
]

{ #category : #'private - ffi' }
SkiaParagraphBuilder >> primPushStyle: aSkiaParagraphTextStyle [
	self ffiCall: #(void skia_paragraph_builder_push_style(self, SkiaParagraphTextStyle aSkiaParagraphTextStyle))
]

{ #category : #'api - builder' }
SkiaParagraphBuilder >> pushStyle: aSkiaParagraphTextStyle [
	self primPushStyle: aSkiaParagraphTextStyle
]

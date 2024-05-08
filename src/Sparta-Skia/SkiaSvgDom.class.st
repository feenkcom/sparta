Class {
	#name : #SkiaSvgDom,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaSvgDom class >> parse: aString fontManager: aFontManager [

	^ self ffiLibrary newString: aString during: [ :aStringBox |
		self fromNativeHandle: (self primParse: aStringBox fontManager: aFontManager) ]
]

{ #category : #'private - ffi' }
SkiaSvgDom class >> primParse: aGtBoxerString fontManager: aFontManager [
	^ self ffiCall: #(void* skia_svg_parse(void* aGtBoxerString, void* aFontManager))
]

{ #category : #'private - ffi' }
SkiaSvgDom class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_svg_dom_drop(void* aHandle))
]

{ #category : #accessing }
SkiaSvgDom >> containerExtent: aPoint [
	self
		primSetContainerWidth: aPoint x
		height: aPoint y
]

{ #category : #'private - ffi' }
SkiaSvgDom >> primSetContainerWidth: aWidth height: aHeight [
	^ self ffiCall: #(void skia_svg_set_container_size(self, scalar aWidth, scalar aHeight))
]

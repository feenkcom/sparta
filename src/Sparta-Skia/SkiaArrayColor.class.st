Class {
	#name : #SkiaArrayColor,
	#superclass : #GtBoxerArray,
	#category : #'Sparta-Skia-External'
}

{ #category : #'library path' }
SkiaArrayColor class >> ffiLibraryName [
	^ SkiaLibrary
]

{ #category : #'private - ffi' }
SkiaArrayColor class >> primCreate [
	^ self ffiCall: #(void* skia_color_array_default())
]

{ #category : #'private - ffi' }
SkiaArrayColor class >> primCreateNew: aSize withAll: aValue [
	^ self ffiCall: #(void* skia_color_array_create_with(SkiaColor aValue, size_t aSize))
]

{ #category : #'private - ffi' }
SkiaArrayColor class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_color_array_drop(void* aHandle))
]

{ #category : #accessing }
SkiaArrayColor >> asArray [
	<return: #Array of: #Color>

	^ (1 to: self size) collect: [ :anIndex | self at: anIndex ]
]

{ #category : #accessing }
SkiaArrayColor >> at: anIndex [
	<return: #Color>

	^ (self primAt: anIndex - 1) asColor
]

{ #category : #accessing }
SkiaArrayColor >> at: anIndex put: aColor [
	super at: anIndex put: (SkiaColor fromColor: aColor)
]

{ #category : #'private - ffi' }
SkiaArrayColor >> externalType [
	^ SkiaColor
]

{ #category : #'private - ffi' }
SkiaArrayColor >> primAt: anIndex [
	^ self ffiCall: #(SkiaColor skia_color_array_at(self, size_t anIndex))
]

{ #category : #'private - ffi' }
SkiaArrayColor >> primAt: anIndex put: aSkiaColor [
	^ self ffiCall: #(void skia_color_array_at_put(self, size_t anIndex, SkiaColor aSkiaColor))
]

{ #category : #'private - ffi' }
SkiaArrayColor >> primGetCapacity [
	^ self ffiCall: #(size_t skia_color_array_get_capacity(self))
]

{ #category : #'private - ffi' }
SkiaArrayColor >> primGetData [
	^ self ffiCall: #(void* skia_color_array_get_data(self))
]

{ #category : #'private - ffi' }
SkiaArrayColor >> primGetLength [
	^ self ffiCall: #(size_t skia_color_array_get_length(self))
]

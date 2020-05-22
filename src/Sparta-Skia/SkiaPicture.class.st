Class {
	#name : #SkiaPicture,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaPicture class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_picture_drop(void* aHandle))
]

{ #category : #accessing }
SkiaPicture >> bounds [
	<return: #Rectangle>

	^ (SkiaRectangleF32 fromNativeHandle: self primCullRect) asRectangle
]

{ #category : #'gt-extension' }
SkiaPicture >> gtInfoFor: aView [
	<gtView>

	^ ({
		#uniqueId -> self uniqueId.
		#bounds -> self bounds.
	 } asOrderedDictionary gtItemsFor: aView)
			title: 'Info';
			priority: 2
]

{ #category : #'private - ffi' }
SkiaPicture >> primCullRect [
	^ self ffiCall: #(void* skia_picture_cull_rect(self))
]

{ #category : #'private - ffi' }
SkiaPicture >> primUniqueId [
	^ self ffiCall: #(uint32 skia_picture_unique_id(self))
]

{ #category : #accessing }
SkiaPicture >> uniqueId [
	<return: #Number>

	^ self primUniqueId
]

Class {
	#name : #SkiaTextureInfo,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaTextureInfo class >> primCreate [
	^ self ffiCall: #(void* skia_texture_info_default())
]

{ #category : #'private - ffi' }
SkiaTextureInfo class >> primCreateTarget: aTargetEnum id: anId [
	^ self ffiCall: #(void* skia_texture_info_from_target_and_id(uint aTargetEnum, uint anId))
]

{ #category : #'private - ffi' }
SkiaTextureInfo class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_texture_info_drop(void* aHandle))
]

{ #category : #'instance creation' }
SkiaTextureInfo class >> target: aTarget id: anId [
	^ self fromNativeHandle: (self primCreateTarget: aTarget id: anId)
]

{ #category : #accessing }
SkiaTextureInfo >> format [
	<return: #Number>
	
	^ self primGetFormat
]

{ #category : #'gt-extension' }
SkiaTextureInfo >> gtInforFor: aView [
	<gtView>

	^ ({
		#target -> self target.
		#id -> self id.
		#format -> self format.
	 } asOrderedDictionary gtItemsFor: aView)
			title: 'Info';
			priority: 2
]

{ #category : #accessing }
SkiaTextureInfo >> id [
	<return: #Number>
	
	^ self primGetId
]

{ #category : #'private - ffi' }
SkiaTextureInfo >> primGetFormat [
	^ self ffiCall: #(uint skia_texture_info_get_format(self))
]

{ #category : #'private - ffi' }
SkiaTextureInfo >> primGetId [
	^ self ffiCall: #(uint skia_texture_info_get_id(self))
]

{ #category : #'private - ffi' }
SkiaTextureInfo >> primGetTarget [
	^ self ffiCall: #(uint skia_texture_info_get_target(self))
]

{ #category : #printing }
SkiaTextureInfo >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	super printOn: aStream.
	aStream
		nextPutAll: ' id: ';
		print: self id.
	aStream
		nextPutAll: ' target: ';
		print: self target.
	aStream
		nextPutAll: ' format: ';
		print: self format
]

{ #category : #accessing }
SkiaTextureInfo >> target [
	<return: #Number>
	
	^ self primGetTarget
]

Class {
	#name : #SkiaBackendTexture,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaBackendTexture class >> extent: aPoint mipMapped: isMipMapped textureInfo: aSkiaTextureInfo [
	^ self fromNativeHandle: (self primCreateWidth: aPoint x height: aPoint y mipMapped: isMipMapped textureInfo: aSkiaTextureInfo)
]

{ #category : #'private - ffi' }
SkiaBackendTexture class >> primCreateWidth: aWidth height: aHeight mipMapped: isMipMapped textureInfo: aSkiaTextureInfo [
	^ self ffiCall: #(void* skia_backend_texture_new_gl(
		int32 aWidth,
		int32 aHeight,
		bool isMipMapped,
		SkiaTextureInfo aSkiaTextureInfo
	))
]

{ #category : #'private - ffi' }
SkiaBackendTexture class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_backend_texture_drop(void* aHandle))
]

{ #category : #'gt-extension' }
SkiaBackendTexture >> asDictionary [
	^ {
		#width -> self width.
		#height -> self height.
		#hasMipMaps -> self hasMipMaps.
		#isProtected -> self isProtected.
		#isValid -> self isValid.
	 } asOrderedDictionary
]

{ #category : #'gt-extension' }
SkiaBackendTexture >> gtInfoFor: aView [
	<gtView>

	^ (self asDictionary gtItemsFor: aView)
			title: 'Info';
			priority: 2
]

{ #category : #'gt-extension' }
SkiaBackendTexture >> gtTextureInfoFor: aView [
	<gtView>

	^ (self textureInfo gtInfoFor: aView)
			title: 'Texture Info';
			priority: 3
]

{ #category : #testing }
SkiaBackendTexture >> hasMipMaps [
	^ self primHasMipMaps
]

{ #category : #accessing }
SkiaBackendTexture >> height [
	^ self primGetHeight
]

{ #category : #testing }
SkiaBackendTexture >> isProtected [
	^ self primIsProtected
]

{ #category : #testing }
SkiaBackendTexture >> isValid [
	^ self primIsValid
]

{ #category : #'private - ffi' }
SkiaBackendTexture >> primGetGlTextureInfo [
	^ self ffiCall: #(void* skia_backend_texture_get_gl_texture_info(self))
]

{ #category : #'private - ffi' }
SkiaBackendTexture >> primGetHeight [
	^ self ffiCall: #(int32 skia_backend_texture_get_height(self))
]

{ #category : #'private - ffi' }
SkiaBackendTexture >> primGetWidth [
	^ self ffiCall: #(int32 skia_backend_texture_get_width(self))
]

{ #category : #'private - ffi' }
SkiaBackendTexture >> primHasMipMaps [
	^ self ffiCall: #(bool skia_backend_texture_has_mip_maps(self))
]

{ #category : #'private - ffi' }
SkiaBackendTexture >> primIsProtected [
	^ self ffiCall: #(bool skia_backend_texture_is_protected(self))
]

{ #category : #'private - ffi' }
SkiaBackendTexture >> primIsValid [
	^ self ffiCall: #(bool skia_backend_texture_is_valid(self))
]

{ #category : #accessing }
SkiaBackendTexture >> textureInfo [
	<return: #SkiaTextureInfo>

	^ SkiaTextureInfo fromNativeHandle: (self primGetGlTextureInfo)
]

{ #category : #accessing }
SkiaBackendTexture >> width [
	^ self primGetWidth
]

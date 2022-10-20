Class {
	#name : #SkiaPicture,
	#superclass : #SkiaExternalObject,
	#category : 'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaPicture class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_picture_drop(void* aHandle))
]

{ #category : #accessing }
SkiaPicture >> approximateOpCount [
	<return: #Number>
	
	^ self primApproximateOpCount
]

{ #category : #accessing }
SkiaPicture >> approximateOpPerPoint [
	| theBounds thePoints |
	<return: #Number>
	
	theBounds := self bounds.
	thePoints := theBounds height * theBounds width.
	(thePoints closeTo: 0)
		ifTrue: [ ^ 0 ].

	^ (self approximateOpCount / (theBounds height * theBounds width)) asFloat
]

{ #category : #accessing }
SkiaPicture >> asByteArray [
	"Serialzie this picture as a byte array"
	<return: #ByteArray>
	| aBoxerArray |
	
	aBoxerArray := GtBoxerArrayU8 new.
	self primSerialize: aBoxerArray.
	^ aBoxerArray asByteArray
]

{ #category : #'gt-extension' }
SkiaPicture >> asForm [
	| aCanvas |
	
	aCanvas := SkiaCanvas extent: self bounds extent ceiling asIntegerPoint.
	self playbackOn: aCanvas surfaceCanvas.
	
	^ aCanvas asForm
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
		#operations -> self approximateOpCount
	 } asOrderedDictionary gtItemsFor: aView)
			title: 'Info';
			priority: 2
]

{ #category : #accessing }
SkiaPicture >> isEmpty [
	<return: #Boolean>
	
	^ self primIsEmpty
]

{ #category : #accessing }
SkiaPicture >> isSimple [
	<return: #Boolean>
	
	^ self approximateOpCount <= 5 or: [ self approximateOpPerPoint <= 0.0001 ]
]

{ #category : #accessing }
SkiaPicture >> playbackOn: aCanvas [
	self primPlaybackOn: aCanvas
]

{ #category : #'private - ffi' }
SkiaPicture >> primApproximateOpCount [
	^ self ffiCall: #(size_t skia_picture_approximate_op_count(self))
]

{ #category : #'private - ffi' }
SkiaPicture >> primCullRect [
	^ self ffiCall: #(void* skia_picture_cull_rect(self))
]

{ #category : #'private - ffi' }
SkiaPicture >> primIsEmpty [
	^ self ffiCall: #(bool skia_picture_is_empty(self))
]

{ #category : #'private - ffi' }
SkiaPicture >> primPlaybackOn: aCanvas [
	^ self ffiCall: #(void skia_picture_playback(self, SkiaSurfaceCanvas aCanvas))
]

{ #category : #'private - ffi' }
SkiaPicture >> primSerialize: aBoxerArrayU8 [
	^ self ffiCall: #(void skia_picture_serialize(self, GtBoxerArrayU8 aBoxerArrayU8))
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

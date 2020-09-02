Class {
	#name : #SkiaPictureRecorder,
	#superclass : #SkiaExternalObject,
	#instVars : [
		'bounds'
	],
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaPictureRecorder class >> primCreate [
	^ self ffiCall: #(void* skia_picture_recorder_new())
]

{ #category : #'private - ffi' }
SkiaPictureRecorder class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_picture_recorder_drop(void** aHandle))
]

{ #category : #accessing }
SkiaPictureRecorder >> beginRecording: aBounds [
	<return: #SkiaSurfaceCanvas>
	
	self bounds: aBounds.
	^ SkiaSurfaceCanvas fromNativeHandle: (self primBeginRecordingLeft: aBounds left top: aBounds top right: aBounds right bottom: aBounds bottom)
]

{ #category : #accessing }
SkiaPictureRecorder >> bounds [
	^ bounds
]

{ #category : #accessing }
SkiaPictureRecorder >> bounds: anObject [
	bounds := anObject
]

{ #category : #accessing }
SkiaPictureRecorder >> canvas [
	^ SkiaSurfaceCanvas fromNativeHandle: (self
		primBeginRecordingLeft: self bounds left
		top: self bounds top
		right: self bounds right
		bottom: self bounds bottom)
]

{ #category : #accessing }
SkiaPictureRecorder >> extent [
	^ self bounds extent
]

{ #category : #accessing }
SkiaPictureRecorder >> finishRecording [
	<return: #SkiaPicture>
	
	^ SkiaPicture fromNativeHandle: self primFinishRecording
]

{ #category : #'private - ffi' }
SkiaPictureRecorder >> primBeginRecordingLeft: aLeft top: aTop right: aRight bottom: aBottom [
	^ self ffiCall: #(void* skia_picture_recorder_begin_recording(
		self,
		scalar aLeft,
		scalar aTop,
		scalar aRight,
		scalar aBottom))
]

{ #category : #'private - ffi' }
SkiaPictureRecorder >> primFinishRecording [
	^ self ffiCall: #(void* skia_picture_recorder_finish_recording(self))
]

{ #category : #accessing }
SkiaPictureRecorder >> snapshot [
	^ self finishRecording
]

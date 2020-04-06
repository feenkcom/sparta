Class {
	#name : #SkiaBinaryContext,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #example }
SkiaBinaryContext class >> example [
	| stream amount colors rectangles context surface |
	stream := SkiaBinaryStream new.

amount := 100.
colors := amount timesCollect: [ Color random ].
rectangles := amount timesCollect: [ ((500 atRandom @ 500 atRandom) extent: (500 atRandom @ 500 atRandom)) ].


[
stream resetToStart.
colors with: rectangles do: [ :eachColor :eachRectangle |
	stream
		newPaint;
		paintSetColor: eachColor;
		fillRectangle: eachRectangle;
		popPaint ].
	
context := SkiaBinaryContext surface: (SkiaSurface newRasterPremultipled: 1000@1000).
context execute: stream contents size: stream size ] timeToRun asMilliSeconds.

surface := context toSurface.
surface flush.
surface.
]

{ #category : #'private - ffi' }
SkiaBinaryContext class >> primCreateSurface: aSkiaSurface [
	^ self ffiCall: #(void* skia_binary_context_new ( SkiaSurface aSkiaSurface ) )
]

{ #category : #'private - ffi' }
SkiaBinaryContext class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_binary_context_drop(void* aHandle))
]

{ #category : #'instance creation' }
SkiaBinaryContext class >> surface: aSurface [
	"A surface is consumed"
	| aContext |
	
	aContext := self fromNativeHandle: (self primCreateSurface: aSurface).
	aSurface release.
	^ aContext
]

{ #category : #'api - context' }
SkiaBinaryContext >> execute: aByteArray size: aSize [
	self primExecute: aByteArray length: aSize
]

{ #category : #'private - ffi' }
SkiaBinaryContext >> primExecute: aBuffer length: aLength [
	^ self ffiCall: #(void skia_binary_execute(self, void* aBuffer, size_t aLength))
]

{ #category : #'private - ffi' }
SkiaBinaryContext >> primGetSurface [
	^ self ffiCall: #(void* skia_binary_extract_surface(self))
]

{ #category : #'api - context' }
SkiaBinaryContext >> toSurface [
	<return: #SkiaSurface>
	| aSurface |
	
	aSurface := SkiaSurface fromNativeHandle: self primGetSurface.
	self release.
	^ aSurface
]

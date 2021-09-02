Class {
	#name : 'SkiaTextToGlyphsBatch',
	#superclass : 'SkiaExternalObject',
	#category : 'Sparta-Skia-External'
}

{ #category : 'private - ffi' }
SkiaTextToGlyphsBatch class >> primCreate [
	^ self ffiCall: #(void* skia_text_to_glyphs_batch_create())
]

{ #category : 'private - ffi' }
SkiaTextToGlyphsBatch class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_text_to_glyphs_batch_drop(void** aHandle))
]

{ #category : 'adding' }
SkiaTextToGlyphsBatch >> addString: aGtBoxerString encoding: aSkiaTextEncoding font: aSkiaFont paint: aSkiaPaint glyphs: aGtBoxerArrayU16 [
	self primAddFont: aSkiaFont string: aGtBoxerString encoding: aSkiaTextEncoding glyphs: aGtBoxerArrayU16 paint: aSkiaPaint
]

{ #category : 'api - measurement' }
SkiaTextToGlyphsBatch >> advanceAt: anIndex [
	<return: #Float>

	^ self primGetAdvanceAt: anIndex - 1
]

{ #category : 'api - measurement' }
SkiaTextToGlyphsBatch >> bottomAt: anIndex [
	<return: #Float>

	^ self primGetBottomAt: anIndex - 1
]

{ #category : 'api - measurement' }
SkiaTextToGlyphsBatch >> boundsAt: anIndex [
	<return: #Rectangle>

	^ (self leftAt: anIndex) @ (self topAt: anIndex)
		corner: (self rightAt: anIndex) @ (self bottomAt: anIndex)
]

{ #category : 'api - measurement' }
SkiaTextToGlyphsBatch >> leftAt: anIndex [
	<return: #Float>

	^ self primGetLeftAt: anIndex - 1
]

{ #category : 'private - ffi' }
SkiaTextToGlyphsBatch >> primAddFont: aSkiaFont string: aGtBoxerString encoding: aSkiaTextEncoding glyphs: aGtBoxerArrayU16 paint: aSkiaPaint [
	^ self ffiCall: #(void skia_text_to_glyphs_batch_add(
		self,
		SkiaFont aSkiaFont,
		GtBoxerString aGtBoxerString,
		SkiaTextEncoding aSkiaTextEncoding,
		GtBoxerArrayU16 aGtBoxerArrayU16,
		SkiaPaint aSkiaPaint
	))
]

{ #category : 'private - ffi' }
SkiaTextToGlyphsBatch >> primGetAdvanceAt: anIndex [
	^ self ffiCall: #(scalar skia_text_to_glyphs_batch_get_advance_at(self, size_t anIndex))
]

{ #category : 'private - ffi' }
SkiaTextToGlyphsBatch >> primGetBottomAt: anIndex [
	^ self ffiCall: #(scalar skia_text_to_glyphs_batch_get_bottom_at(self, size_t anIndex))
]

{ #category : 'private - ffi' }
SkiaTextToGlyphsBatch >> primGetLeftAt: anIndex [
	^ self ffiCall: #(scalar skia_text_to_glyphs_batch_get_left_at(self, size_t anIndex))
]

{ #category : 'private - ffi' }
SkiaTextToGlyphsBatch >> primGetLength [
	^ self ffiCall: #(size_t skia_text_to_glyphs_batch_length(self))
]

{ #category : 'private - ffi' }
SkiaTextToGlyphsBatch >> primGetRightAt: anIndex [
	^ self ffiCall: #(scalar skia_text_to_glyphs_batch_get_right_at(self, size_t anIndex))
]

{ #category : 'private - ffi' }
SkiaTextToGlyphsBatch >> primGetTopAt: anIndex [
	^ self ffiCall: #(scalar skia_text_to_glyphs_batch_get_top_at(self, size_t anIndex))
]

{ #category : 'private - ffi' }
SkiaTextToGlyphsBatch >> primProcess [
	^ self ffiCall: #(void skia_text_to_glyphs_batch_process(self))
]

{ #category : 'accessing' }
SkiaTextToGlyphsBatch >> process [
	self primProcess
]

{ #category : 'api - measurement' }
SkiaTextToGlyphsBatch >> rightAt: anIndex [
	<return: #Float>

	^ self primGetRightAt: anIndex - 1
]

{ #category : 'api - measurement' }
SkiaTextToGlyphsBatch >> topAt: anIndex [
	<return: #Float>

	^ self primGetTopAt: anIndex - 1
]

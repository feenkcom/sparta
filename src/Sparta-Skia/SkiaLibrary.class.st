Class {
	#name : #SkiaLibrary,
	#superclass : #FFILibrary,
	#traits : 'TGtWithStringBox + TGtWithPointBoxF32 + TGtWithArrayBoxU8 + TGtWithArrayBoxU16 + TGtWithArrayBoxF32 + TGtWithPhlowRust + TGtWithArrayBoxU32',
	#classTraits : 'TGtWithStringBox classTrait + TGtWithPointBoxF32 classTrait + TGtWithArrayBoxU8 classTrait + TGtWithArrayBoxU16 classTrait + TGtWithArrayBoxF32 classTrait + TGtWithPhlowRust classTrait + TGtWithArrayBoxU32 classTrait',
	#category : #'Sparta-Skia-Library'
}

{ #category : #accessing }
SkiaLibrary class >> ffiLibrary [
	^ self uniqueInstance
]

{ #category : #logger }
SkiaLibrary class >> initEnvLogger [
	self uniqueInstance initEnvLogger
]

{ #category : #'class initialization' }
SkiaLibrary class >> initialize [
	SessionManager default registerUserClassNamed: self name
]

{ #category : #'class initialization' }
SkiaLibrary class >> startUp: isANewSession [
	isANewSession
		ifTrue: [ self initEnvLogger ]
]

{ #category : #'api - library' }
SkiaLibrary >> androidLibraryName [
	^ 'libSkia.so'
]

{ #category : #'api - library' }
SkiaLibrary >> hasModule [
	"Return if there is a loadable and working Skia library installed, false otherwise"
	<return: #Boolean>
	| aResult |

	aResult := nil.
	
	[ aResult := self primTest ]
		on: Error
		do: [ :e | 
			NonInteractiveTranscript stderr nextPutAll: e description; cr.
			aResult := false ].

	^ aResult ifNil: [ false ]
]

{ #category : #'api - startup' }
SkiaLibrary >> initEnvLogger [
	[ self primInitEnvLogger ]
		on: Error
		do: [ :e | NonInteractiveTranscript stdout nextPutAll: '[Skia] Could not init env logger'; cr ]
]

{ #category : #'api - library' }
SkiaLibrary >> macLibraryName [
	^ FFIMacLibraryFinder findLibrary: 'libSkia.dylib'
]

{ #category : #'private - ffi' }
SkiaLibrary >> primInitEnvLogger [
	^ self ffiCall: #(void skia_init_env_logger())
]

{ #category : #'private - ffi' }
SkiaLibrary >> primTest [
	^ self ffiCall: #(bool skia_test())
]

{ #category : #'api - library' }
SkiaLibrary >> unix32LibraryName [
	^ FFIUnix32LibraryFinder findLibrary: 'libSkia.so'
]

{ #category : #'api - library' }
SkiaLibrary >> unix64LibraryName [
	^ FFIUnix64LibraryFinder findLibrary: 'libSkia.so'
]

{ #category : #'api - library' }
SkiaLibrary >> win32LibraryName [
	^ FFIWindowsLibraryFinder findLibrary: 'Skia.dll'
]

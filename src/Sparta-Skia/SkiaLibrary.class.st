Class {
	#name : #SkiaLibrary,
	#superclass : #FFILibrary,
	#category : #'Sparta-Skia-Library'
}

{ #category : #'accessing platform' }
SkiaLibrary >> detectLibrary: aFileName [
	^ ({ Smalltalk imageDirectory . Smalltalk vmDirectory . FileSystem workingDirectory }
		collect: [ :aPath | aPath asFileReference / aFileName ])
			detect: #exists
			ifFound: #fullName
			ifNone: [ aFileName ]
]

{ #category : #'accessing platform' }
SkiaLibrary >> hasModule [
	"Return if there is a loadable and working Skia library installed, false otherwise"
	<return: #Boolean>
	| aResult |

	aResult := nil.
	
	[ aResult := self primTest ]
		on: Error
		do: [ :e | aResult := false ].

	^ aResult ifNil: [ false ]
]

{ #category : #'accessing platform' }
SkiaLibrary >> macModuleName [
	^ self detectLibrary: 'libSkia.dylib'
]

{ #category : #'accessing platform' }
SkiaLibrary >> primTest [
	^ self ffiCall: #(bool skia_test())
]

{ #category : #'accessing platform' }
SkiaLibrary >> unixModuleName [
	^ self detectLibrary: 'libSkia.so'
]

{ #category : #'accessing platform' }
SkiaLibrary >> win32ModuleName [
	^ self detectLibrary: 'libSkia.dll'
]

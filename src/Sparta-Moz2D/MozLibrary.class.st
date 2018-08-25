"
I'm an util to answer a name of Moz2D module library on different platforms. 
I just implement a double dispatch with the platform.
"
Class {
	#name : #MozLibrary,
	#superclass : #FFILibrary,
	#category : 'Sparta-Moz2D-Library'
}

{ #category : #testing }
MozLibrary >> hasModule [
	"Return if there is a loadable and working Moz2D library installed, false otherwise"
	<return: #Boolean>
	| aResult |

	aResult := nil.
	
	[ aResult := self primTest ]
		on: Error
		do: [ :e | aResult := false ].

	^ aResult ifNil: [ false ]
]

{ #category : #'accessing platform' }
MozLibrary >> macModuleName [
	^ 'libMoz2D.dylib'
]

{ #category : #'private - ffi' }
MozLibrary >> primTest [
	^ self ffiCall: #(bool moz2d_test())
]

{ #category : #'accessing platform' }
MozLibrary >> unixModuleName [
	^ 'libMoz2D.so'
]

{ #category : #'accessing platform' }
MozLibrary >> win32ModuleName [ 
	^ 'libMoz2D.dll'
]

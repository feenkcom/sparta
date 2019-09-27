"
I add support of debugging messages, for instance I can print a warning message to the Transcript and stderr at the same time.

A message printed to stderr is colored in red, to simplify error detecting in a log stream
"
Trait {
	#name : #TMozDebug,
	#category : 'Sparta-Moz2D-Library'
}

{ #category : #'private - ffi' }
TMozDebug classSide >> primStderr: aString [

	self ffiCall: #(void moz2d_print_stderr ( String aString ) )
]

{ #category : #debug }
TMozDebug classSide >> warning: aMessageBlock [
	"| message |

	message := '[', self name asString ,'] ', aMessageBlock value.

	Transcript show: message; cr.
	self primStderr: message"
]

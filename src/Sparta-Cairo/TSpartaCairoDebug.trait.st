Trait {
	#name : #TSpartaCairoDebug,
	#category : 'Sparta-Cairo-Library'
}

{ #category : #debug }
TSpartaCairoDebug classSide >> warning: aMessageBlock [
	"| message |

	message := '[', self name asString ,'] ', aMessageBlock value.

	Transcript show: message; cr"
]

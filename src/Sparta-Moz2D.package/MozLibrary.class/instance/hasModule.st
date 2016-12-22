testing
hasModule
	"Return if there is a loadable and working Moz2D library installed, false otherwise"
	<return: #Boolean>
	| aResult |
	
	aResult := true.
	
	[ self testCall ]
		on: Error
		do: [ :e | aResult := false ].
	
	^ aResult
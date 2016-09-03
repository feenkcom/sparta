doits
postLoadActions: aSpecLoader
	|group protocol columnIndex |
	
	group := (aSpecLoader spec required difference: aSpecLoader spec packages keys) asArray first asSymbol.
	columnIndex := group indexOf: $:.
	"we load code only without Iceberg"
	columnIndex <= 0
		ifTrue: [ ^ self ].

	protocol := group first: (group size - columnIndex).
	
	protocol = #git
		ifTrue: [ ^ self postLoadGit: aSpecLoader ].
	
	protocol = #file
		ifTrue: [ ^ self postLoadFile: aSpecLoader ].
		
	Error signal: 'Unknown load protocol ', group.
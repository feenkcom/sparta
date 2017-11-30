opening
closeWindow
	self window
		ifNil: [ self delete ]
		ifNotNil: [ :aWindow | aWindow close ]
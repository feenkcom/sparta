accessing platform
unixModuleName

	#( 
		'libMoz2D.so') 
	do: [ :path | 
		path asFileReference exists ifTrue: [ ^ path ] ].
	
	self error: 'Cannot locate Moz2D library. Please check if it installed on your system'
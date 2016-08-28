accessing
packagesToCheck
	"Return an array of package names that should be checked by sparta lint rules"
	<return: #'Array<String>'>

	^ { 'Sparta-Core'. 'Sparta-Critics'. 'Sparta-Moz2D' }
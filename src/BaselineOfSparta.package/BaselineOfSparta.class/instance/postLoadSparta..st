actions
postLoadSparta: aSpecLoader
	"Let sparta load as it wish"
	
	self
		load: 'Sparta'
		from: aSpecLoader spec versionSpec repositories map keys first
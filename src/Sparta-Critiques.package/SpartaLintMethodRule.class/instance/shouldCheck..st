testing
shouldCheck: aMethod
	"We check methods only from desired Sparta packages"
	<return: #Boolean>

	^ self packagesToCheck includes: (aMethod package packageName)
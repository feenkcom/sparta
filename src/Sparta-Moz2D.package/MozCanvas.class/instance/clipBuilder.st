builders
clipBuilder
	^ clipBuilder ifNil: [ clipBuilder := MozClipper new ]
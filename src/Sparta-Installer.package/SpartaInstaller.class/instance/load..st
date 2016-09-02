actions
load: anOrderedPackageList

	NonInteractiveTranscript stdout cr.
	anOrderedPackageList do: [ :package |
		NonInteractiveTranscript stdout show: ('Loading latest version of ', package, '...'); cr.
		repository updatePackage: package ].
	self postLoadActions
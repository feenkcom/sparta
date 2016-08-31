actions
load: anOrderedPackageList

	anOrderedPackageList do: [ :package |
		NonInteractiveTranscript stdout show: ('Loading latest version of ', package, '...'); cr.
		repository updatePackage: package ]
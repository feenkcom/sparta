actions
load: anOrderedPackageList

	anOrderedPackageList do: [ :package |
		repository updatePackage: package ]
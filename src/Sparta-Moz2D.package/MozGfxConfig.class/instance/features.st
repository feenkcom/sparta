accessing
features

	^ Array streamContents: [ :aStream |
		self featuresDo: [ :feature | aStream nextPut: feature ] ]
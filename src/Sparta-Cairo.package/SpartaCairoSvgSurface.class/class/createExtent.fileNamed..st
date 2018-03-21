instance creation
createExtent: anExtent fileNamed: aFileNameString
	| aFileReference |

	aFileReference := aFileNameString asFileReference.
	
	^ (self
		primCreateWidth: anExtent x
		height: anExtent y
		fileName: aFileReference fullName)
			extent: anExtent;
			autoRelease
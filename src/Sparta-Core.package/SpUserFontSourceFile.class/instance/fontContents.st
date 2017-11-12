accessing
fontContents
	| aBuffer |

	aBuffer := #[].
	self file asFileReference binaryReadStreamDo: [ :aStream | aBuffer := aStream contents ].
	^ aBuffer
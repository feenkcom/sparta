Extension { #name : #FFIExternalResourceManager }

{ #category : #'*Sparta-Core' }
FFIExternalResourceManager class >> removeResource: oldObject [
	self uniqueInstance removeResource: oldObject
]

{ #category : #'*Sparta-Core' }
FFIExternalResourceManager >> removeResource: oldObject [
	registry remove: oldObject ifAbsent: [ ]
]

{ #category : #'*Sparta-Core' }
FFIExternalResourceManager >> resourceCount [
	^ registry size
]

private
privateSetAttributeFloatArray: anArrayOrFloat index: anIndex
	| array numbers |
	numbers := anArrayOrFloat isCollection
		ifTrue: [ anArrayOrFloat ]
		ifFalse: [ { anArrayOrFloat } ].

	array := (FFIExternalArray externalNewType: 'float' size: numbers size)
		fillFrom: numbers with: #yourself;
		yourself.

	"Filter copies array in std::vector, so we can free memory right after"
	self
		primSetAttributeFloatArray: array getHandle
		length: numbers size
		index: anIndex.
		
	array free
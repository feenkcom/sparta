private
privateSetAttributeMatrix5x4: anArrayOrFlaot index: anIndex
	| array numbers |
	
	numbers := anArrayOrFlaot isCollection
		ifTrue: [ anArrayOrFlaot ]
		ifFalse: [ Array new: 20 withAll: anArrayOrFlaot  ].
	
	self
		assert: [ numbers size = 20 ]
		descriptionBlock: [ 'Matrix 5x4 must contain 20 elements' ].

	array := (FFIExternalArray externalNewType: 'float' size: numbers size)
		fillFrom: numbers with: #yourself;
		yourself.

	"Filter copies array in std::vector, so we can free memory right after"
	self
		primSetAttributeMatrix5x4: array getHandle
		index: anIndex.

	array free
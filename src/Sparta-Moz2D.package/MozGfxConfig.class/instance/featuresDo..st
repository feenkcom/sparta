enumerating
featuresDo: aBlock
	| callback |
	callback := FFICallback 
		signature: #(void (char* aNamePtr, char* aDescriptionPtr, void* aFeature))
		block: [ :aNamePtr :aDescriptionPtr :aFeaturePtr |
			[ | aName aDescription aFeature |
			
			aName := String streamContents: [ :aStream | | anIndex aChar |
				anIndex := 1.
				[ (aChar := (aNamePtr signedCharAt: anIndex)) ~= Character null ] whileTrue:
					[ aStream nextPut: aChar. anIndex := anIndex + 1 ] ].

			aDescription := String streamContents: [ :aStream | | anIndex aChar |
				anIndex := 1.
				[ (aChar := (aDescriptionPtr signedCharAt: anIndex)) ~= Character null ] whileTrue:
					[ aStream nextPut: aChar. anIndex := anIndex + 1 ] ].
			
			aFeature := MozGfxFeature fromHandle: aFeaturePtr.
			aFeature name: aName.
			aFeature description: aDescription.
			aBlock value: aFeature ]
			on: Error do: [ :e | 0 "Error happened" ] ].
	self primForEachFeature: callback
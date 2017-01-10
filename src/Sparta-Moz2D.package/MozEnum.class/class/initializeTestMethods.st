class initialization
initializeTestMethods
	self createEnumMethod.
	self createPrimitiveMethod.
	self enumerationDictionary keysDo: [ :anItemName | self createTestMethod: anItemName ]
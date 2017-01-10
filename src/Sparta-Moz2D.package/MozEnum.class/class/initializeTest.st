class initialization
initializeTest

	self wantsTestClass ifTrue: [
		self externalEnum.
		self initializeTestClass.
		self initializeTestMethods ]
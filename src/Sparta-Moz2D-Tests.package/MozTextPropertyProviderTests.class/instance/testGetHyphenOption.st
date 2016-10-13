tests
testGetHyphenOption
	| actualOption helper |
	helper := MozTextPropertyProviderTestsHelper new.
	helper breakPriority: MozTextBreakPriority eWordWrapBreak.
	propertyProvider metricsProvider: helper.

	actualOption := self primGetHyphenOption: propertyProvider.
	self assert: actualOption equals: MozTextHyphensOption AUTO value
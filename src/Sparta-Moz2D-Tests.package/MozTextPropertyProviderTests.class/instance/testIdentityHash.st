tests
testIdentityHash
	| actualHash |

	actualHash := self primGetSmalltalkPtr: propertyProvider.
	self assert: actualHash equals: propertyProvider identityHash
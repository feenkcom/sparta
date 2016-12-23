accessing
fromIdentityHash: aNumber
	"Return a text property provider for provided itentity hash.
	If there is no such instance return nil"
	<return: #MozTextPropertyProvider>

	^ self instances
		at: aNumber
		ifAbsent: nil
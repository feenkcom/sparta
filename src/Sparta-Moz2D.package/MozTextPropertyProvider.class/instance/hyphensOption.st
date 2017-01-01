accessing
hyphensOption
	"Returns the provider's hyphenation setting, so callers can decide
	whether it is necessary to send hyphenationBreaksWithin:
	Hyphens option can be one of NONE, AUTO or MANUAL"
	^ self breakPriority canWrapHyphens
		ifTrue: [ MozTextHyphensOption MANUAL ]
		ifFalse: [ MozTextHyphensOption NONE ]
converting
asPureForm
	| form |

	form := Form extent: self extent depth: 32.
	form unhibernate.
	self primAsForm: form bits.
	^ form
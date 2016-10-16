accessing
value: anObject
	value := anObject.
	"commit to backend on change only if key is already set"
	key ifNotNil: [ self export ]
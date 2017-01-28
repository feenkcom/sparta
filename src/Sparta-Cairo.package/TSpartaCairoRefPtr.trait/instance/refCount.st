accessing
refCount
	"Return amount of counted references. If refCount is zero (0),
	something is wrong, because as soon as it drops to 0 object
	gets automatically deleted"
	<return: #Number>

	^ self class refCount: self resourceData
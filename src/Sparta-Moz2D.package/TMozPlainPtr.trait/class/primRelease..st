private - ffi
primRelease: aHandle
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	^ self explicitRequirement
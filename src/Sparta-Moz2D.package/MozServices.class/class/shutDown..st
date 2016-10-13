system startup
shutDown: isImageQuitting
	isImageQuitting ifFalse: [ ^ self ].
	"When image is shutting down we need to shutdown backend services"
	self stop
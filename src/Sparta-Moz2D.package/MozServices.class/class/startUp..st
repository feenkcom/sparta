system startup
startUp: inANewImageSession
	inANewImageSession ifFalse: [ ^ self ].
	"We need to make sure that all backend services are initialized"
	self start
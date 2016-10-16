services
start
	"First of all we need to start services"
	self primStartServices.
	self primStartGfxConfig.
	OSPlatform current mozSettings export.
	self primStartPlatform
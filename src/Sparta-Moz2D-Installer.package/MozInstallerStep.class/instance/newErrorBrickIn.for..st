instance creation
newErrorBrickIn: anInstaller for: anError
	"Create and return a new step brick"
	
	^ SpartaInstallerErrorBrick new
		hSpaceFill;
		vSpaceFill;
		error: anError
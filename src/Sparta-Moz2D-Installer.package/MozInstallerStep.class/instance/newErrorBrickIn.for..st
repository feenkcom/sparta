instance creation
newErrorBrickIn: anInstaller for: anError
	"Create and return a new step brick"
	
	^ MozInstallerErrorBrick new
		hSpaceFill;
		vSpaceFill;
		error: anError
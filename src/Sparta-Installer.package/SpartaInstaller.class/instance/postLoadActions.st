actions
postLoadActions

	"Pull repository"
	repository pull.

	"Open gui"
	(Smalltalk classNamed: #IceRepositoriesBrowser)
		openOn: { repository }
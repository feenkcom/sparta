running
run
	self steps do: [ :aStep |
		 [ [ aStep runIn: self ]
			on: MozInstallerError
			do: [ :anError | ^ aStep handleError: anError in: self ] ]
				on: Error
				do: [ :anError | ^ aStep handleError: (MozInstallerUnhandledError new error: anError) in: self] ]
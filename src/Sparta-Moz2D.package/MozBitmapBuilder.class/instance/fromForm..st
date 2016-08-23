instance creation
fromForm: aForm
	| form |
	
	form := aForm unhibernate; asFormOfDepth: 32.
	^ (self
		primCreateSurfaceForData: form bits
		width: form width
		height: form height
		stride: form stride
		format: canvas pixelFormat) autoRelease
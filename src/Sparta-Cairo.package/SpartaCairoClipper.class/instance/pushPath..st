clipping
pushPath: aPath

	self
		primSave;
		primNewPath;
		primAppendPath: aPath;
		primClip
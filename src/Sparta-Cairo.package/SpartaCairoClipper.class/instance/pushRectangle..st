clipping
pushRectangle: aRectangle

	self
		primSave;
		primNewPath;
		primRectangleX: aRectangle left Y: aRectangle top width: aRectangle width height: aRectangle height;
		primClip
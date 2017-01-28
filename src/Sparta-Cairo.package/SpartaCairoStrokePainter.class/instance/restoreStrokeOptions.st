private
restoreStrokeOptions
	| theDashes aStrokeOptions |
	
	"stroke options are not set, no need to restore them"
	strokeOptions
		ifNil: [ ^ self ].
	
	aStrokeOptions := canvas defaultStrokeOptions.
	
	self
		primSetLineWidth: aStrokeOptions width;
		primSetLineCap: aStrokeOptions lineCap;
		primSetLineJoin: aStrokeOptions lineJoin;
		primSetMiterLimit: aStrokeOptions miterLimit.
		
	theDashes := FFIExternalArray newType: 'double' size: aStrokeOptions dashPattern size.
	theDashes atAll: (1 to: aStrokeOptions dashPattern size) putAll: aStrokeOptions dashPattern.
	
	self primSetDashes: theDashes getHandle count: aStrokeOptions dashPattern size offset: aStrokeOptions dashOffset
		
	
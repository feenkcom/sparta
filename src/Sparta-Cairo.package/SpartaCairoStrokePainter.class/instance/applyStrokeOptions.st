private
applyStrokeOptions
	| theDashes |
	
	"stroke options are not set, no need to apply them"
	strokeOptions
		ifNil: [ ^ self ].
		
	self
		primSetLineWidth: strokeOptions width;
		primSetLineCap: strokeOptions lineCap;
		primSetLineJoin: strokeOptions lineJoin;
		primSetMiterLimit: strokeOptions miterLimit.
		
	theDashes := FFIExternalArray newType: 'double' size: strokeOptions dashPattern size.
	theDashes atAll: (1 to: strokeOptions dashPattern size) putAll: strokeOptions dashPattern.
	
	self primSetDashes: theDashes getHandle count: strokeOptions dashPattern size offset: strokeOptions dashOffset
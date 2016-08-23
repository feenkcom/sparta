field definition
fieldsDesc
	"
	self rebuildFieldAccessors
	"
	^ #(
		float width;
		float miterLimit;
		float* privateDashPattern;
		size_t privateDashLength;
		float dashOffset;
		MozJoinStyle lineJoin;
		MozCapStyle lineCap
	)
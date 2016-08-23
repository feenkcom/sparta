private - ffi
primColorPatternR: r g: g b: b a: a

	^ self ffiCall: #( MozNativeColorPattern moz2d_pattern_color_create_rgba(float r, float g, float b, float a ) )
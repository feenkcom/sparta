private - ffi
primPushLayer: aMask opaque: anOpaque alpha: anOpacity copy: isCopyBackground a11: a11 a12: a12 a21: a21 a22: a22 a31: a31 a32: a32 x: x y: y width: width height: height

	^ self ffiCall: #(void moz2d_draw_target_push_layer(
		MozCanvas canvas,
		bool anOpaque,
		float anOpacity,
		ExternalAddress aMask,
		float a11,
		float a12,
		float a21,
		float a22,
		float a31,
		float a32,
		int32 x,
		int32 y,
		int32 width,
		int32 height,
		bool isCopyBackground ))
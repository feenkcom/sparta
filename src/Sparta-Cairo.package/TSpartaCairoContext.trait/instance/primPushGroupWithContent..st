private - ffi
primPushGroupWithContent: aCairoContent

	^ self ffiCall: #(void cairo_push_group_with_content (
		SpartaCairoCanvas canvas,
		SpartaCairoContent aCairoContent ) )
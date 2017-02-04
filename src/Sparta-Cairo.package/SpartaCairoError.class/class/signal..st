signalling
signal: aCairoStatus

	^ self new
		status: aCairoStatus;
		messageText: aCairoStatus item asString;
		signal
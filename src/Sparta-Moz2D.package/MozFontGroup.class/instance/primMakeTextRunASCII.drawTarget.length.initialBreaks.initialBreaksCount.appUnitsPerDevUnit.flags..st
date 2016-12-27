private - ffi
primMakeTextRunASCII: aString drawTarget: aDrawTarget length: aLength initialBreaks: initialBreaks initialBreaksCount: initialBreaksCount appUnitsPerDevUnit: aAppUnitsPerDevUnit flags: aTextRunFactoryFlags

	^ self ffiCall: #(MozTextRun moz2d_font_group_make_text_run_ascii (
		MozCanvas aDrawTarget,
		self,
		String aString,
		int32 aLength,
		uint32* initialBreaks,
		uint32 initialBreaksCount,
		int32 aAppUnitsPerDevUnit,
		uint32 aTextRunFactoryFlags))
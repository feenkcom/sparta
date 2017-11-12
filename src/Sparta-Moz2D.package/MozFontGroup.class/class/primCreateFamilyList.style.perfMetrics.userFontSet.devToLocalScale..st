private - ffi
primCreateFamilyList: aFontFamilyList style: aFontStyle perfMetrics: aTextPerf userFontSet: aUserFontSet devToLocalScale: aDevToLocalScale

	^ self ffiCall: #(MozFontGroup moz2d_font_group_create (
		MozFontFamilyList aFontFamilyList,
		MozFontStyle aFontStyle,
		void* aTextPerf,
		MozUserFontSet aUserFontSet,
		float aDevToLocalScale))
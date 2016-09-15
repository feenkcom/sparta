field definition
fieldsDesc
	"
	self rebuildFieldAccessors
	"
	^ #(
		double xHeight;
		double strikeoutSize;
		double strikeoutOffset;
		double underlineSize;
		double underlineOffset;

		double internalLeading;
		double externalLeading;

		double emHeight;
		double emAscent;
		double emDescent;
		double maxHeight;
		double maxAscent;
		double maxDescent;
		double maxAdvance;

		double aveCharWidth;
		double spaceWidth;
		double zeroOrAveCharWidth;
	)
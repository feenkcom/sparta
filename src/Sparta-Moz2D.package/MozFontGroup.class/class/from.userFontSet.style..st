instance creation
from: aFontFamilyList userFontSet: aUserFontSet style: aFontStyle

	^ (self
		primCreateFamilyList: aFontFamilyList
		style: aFontStyle
		perfMetrics: nil
		userFontSet: (aUserFontSet ifNil: [ MozUserFontSet empty ])
		devToLocalScale: 1.0)
			autoRelease;
			style: aFontStyle;
			familyList: aFontFamilyList;
			yourself
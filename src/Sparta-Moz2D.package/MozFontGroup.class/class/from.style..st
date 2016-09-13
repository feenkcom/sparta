instance creation
from: aFontFamilyList style: aFontStyle

	^ (self
		primCreateFamilyList: aFontFamilyList
		style: aFontStyle
		perfMetrics: nil
		userFontSet: nil
		devToLocalScale: 1.0)
			familyList: aFontFamilyList;
			yourself
accessing
build

	^ self class cache
		at: self copy "we copy to allow users to continue building fonts"
		ifAbsentPut: [ self createFontGroup ]
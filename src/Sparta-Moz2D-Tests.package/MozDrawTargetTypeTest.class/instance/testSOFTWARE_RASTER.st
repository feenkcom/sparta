tests
testSOFTWARE_RASTER
	"This method was automatically generated"
	self
		assert: (self itemNamed: self enum SOFTWARE_RASTER item asString) value
		equals: self enum SOFTWARE_RASTER value
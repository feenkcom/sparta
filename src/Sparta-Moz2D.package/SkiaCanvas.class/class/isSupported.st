testing
isSupported
	"Return true if Skia GPU canvas is available and supported, false otherwise"
	<return: #Boolean>

	^ MozLibrary uniqueInstance hasModule and: [
		self primAllowsSkiaGPU and: [
			self primAllowsAcceleratedCanvas and: [
				self primAllowsOpenGLCanvas ] ] ]
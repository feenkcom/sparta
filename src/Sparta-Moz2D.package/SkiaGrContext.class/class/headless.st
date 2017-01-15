instance creation
headless
	"Try to create or return if already exists a unique instance of headless skia context.
	Headless context can be created without window. I may return nullptr if Skia GPU or
	accelerated canvases are not supported or disabled"
	<return: #SkiaGrContext>

	^ (self primGetHeadless)
		headless: true;
		yourself
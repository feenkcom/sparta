instance creation
extent: aPoint
	| aGrContext |

	"try Vulkan first"
	aGrContext := SkiaGrContext create: SkiaBackend kVulkan_GrBackend.
	
	"if not try OpenGL"
	aGrContext isNull
		ifTrue: [ aGrContext := SkiaGrContext create: SkiaBackend kOpenGL_GrBackend ].
		
	"there is no window, fall back to headless"
	aGrContext isNull
		ifTrue: [ aGrContext := SkiaGrContext headless ].
	
	"still no luck... acceleration disabled?
	fallback to software"
	aGrContext isNull
		ifTrue: [ ^ super extent: aPoint ].
	
	^ self
		createContext: aGrContext
		extent: aPoint
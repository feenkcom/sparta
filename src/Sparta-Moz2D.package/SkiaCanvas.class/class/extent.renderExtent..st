instance creation
extent: anExtent renderExtent: aRenderExtent
	| aGrContext |

	"try Vulkan first"
	aGrContext := SkiaGrContext create: SkiaBackend kVulkan_GrBackend.
	
	"if not try OpenGL"
	aGrContext isNull
		ifTrue: [ aGrContext := SkiaGrContext create: SkiaBackend kOpenGL_GrBackend ].
	
	"still no luck... acceleration disabled?
	fallback to software"
	aGrContext isNull
		ifTrue: [ ^ super extent: anExtent ].
	
	^ self
		createContext: aGrContext
		extent: anExtent
		renderExtent: aRenderExtent
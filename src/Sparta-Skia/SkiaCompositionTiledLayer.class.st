Class {
	#name : #SkiaCompositionTiledLayer,
	#superclass : #SkiaCompositionLayer,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #accessing }
SkiaCompositionTiledLayer class >> forCameraPosition: aCameraPosition viewportExtent: aViewportExtent tileExtent: aTileExtent [
	^ self fromNativeHandle: (self
		primCreateCameraX: aCameraPosition x
		cameraY: aCameraPosition y
		width: aViewportExtent x
		height: aViewportExtent y
		tileWidth: aTileExtent x
		tileHeight: aTileExtent y)
]

{ #category : #'private - ffi' }
SkiaCompositionTiledLayer class >> primCreate [
	^ self ffiCall: #(void* compositor_tiled_layer_default())
]

{ #category : #'private - ffi' }
SkiaCompositionTiledLayer class >> primCreateCameraX: aCameraX cameraY: aCameraY width: aWidth height: aHeight tileWidth: aTileWidth tileHeight: aTileHeight [
	^ self ffiCall: #(void* compositor_tiled_layer_new(
		float32 aCameraX,
		float32 aCameraY,
		float32 aWidth,
		float32 aHeight,
		float32 aTileWidth,
		float32 aTileHeight))
]

{ #category : #accessing }
SkiaCompositionTiledLayer >> addFigure: anId offset: anOffset extent: anExtent [
	self
		primAddFigure: anId
		offsetX: anOffset x
		offsetY: anOffset y
		width: anExtent x
		height: anExtent y
]

{ #category : #accessing }
SkiaCompositionTiledLayer >> cameraPosition: aPoint [
	self primSetCameraX: aPoint x cameraY: aPoint y
]

{ #category : #'private - ffi' }
SkiaCompositionTiledLayer >> primAddFigure: anId offsetX: anOffsetX offsetY: anOffsetY width: aWidth height: aHeight [
	^ self ffiCall: #(void compositor_tiled_layer_add_figure(self, TiledFigureId anId, float32 anOffsetX, float32 anOffsetY, float32 aWidth, float32 aHeight))
]

{ #category : #'private - ffi' }
SkiaCompositionTiledLayer >> primGetScaleValue [
	^ self ffiCall: #(float32 compositor_tiled_layer_scale_value(self))
]

{ #category : #'private - ffi' }
SkiaCompositionTiledLayer >> primSetCameraX: aCameraX cameraY: aCameraY [
	^ self ffiCall: #(void compositor_tiled_layer_set_camera_position(
		self,
		float32 aCameraX,
		float32 aCameraY))
]

{ #category : #'private - ffi' }
SkiaCompositionTiledLayer >> primSetFigurePicture: aFigureId picture: aPicture [
	^ self ffiCall: #(void compositor_tiled_layer_figure_set_picture(
		self,
		TiledFigureId aFigureId,
		SkiaCompositorPicture aPicture))
]

{ #category : #'private - ffi' }
SkiaCompositionTiledLayer >> primSetScaleIn: aScaleFactor [
	^ self ffiCall: #(void compositor_tiled_layer_set_scale_in_factor(
		self,
		float32 aScaleFactor))
]

{ #category : #'private - ffi' }
SkiaCompositionTiledLayer >> primSetScaleOut: aScaleFactor [
	^ self ffiCall: #(void compositor_tiled_layer_set_scale_out_factor(
		self,
		float32 aScaleFactor))
]

{ #category : #'private - ffi' }
SkiaCompositionTiledLayer >> primVisibleFiguresIds: anArrayU32 [
	^ self ffiCall: #(void compositor_tiled_layer_visible_figures(self, void* anArrayU32))
]

{ #category : #'private - ffi' }
SkiaCompositionTiledLayer >> primVisibleFiguresIdsWithoutPicture: anArrayU32 [
	^ self ffiCall: #(void compositor_tiled_layer_visible_figures_within_tiles_without_pictures(self, void* anArrayU32))
]

{ #category : #accessing }
SkiaCompositionTiledLayer >> scaleIn: aFloat [
	self primSetScaleIn: aFloat asFloat
]

{ #category : #accessing }
SkiaCompositionTiledLayer >> scaleOut: aFloat [
	self primSetScaleOut: aFloat asFloat
]

{ #category : #accessing }
SkiaCompositionTiledLayer >> scaleValue [
	^ self primGetScaleValue
]

{ #category : #acccessing }
SkiaCompositionTiledLayer >> setFigurePicture: aFigureId picture: aSkiaPicture [
	^ SkiaCompositorPicture
		fromSkiaPicture: aSkiaPicture
		during: [ :aCompositorPicture |		
			self
				primSetFigurePicture: aFigureId
				picture: aCompositorPicture ]
]

{ #category : #accessing }
SkiaCompositionTiledLayer >> visibleFiguresIds [
	^ self ffiLibrary newArrayU32During: [ :anArrayU32 |
		self primVisibleFiguresIds: anArrayU32.
		anArrayU32 asArray ]
]

{ #category : #accessing }
SkiaCompositionTiledLayer >> visibleFiguresIdsWithoutPicture [
	^ self ffiLibrary newArrayU32During: [ :anArrayU32 |
		self primVisibleFiguresIdsWithoutPicture: anArrayU32.
		anArrayU32 asArray ]
]

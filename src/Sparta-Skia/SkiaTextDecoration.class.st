Class {
	#name : 'SkiaTextDecoration',
	#superclass : 'SkiaExternalObject',
	#category : 'Sparta-Skia-External'
}

{ #category : 'private - ffi' }
SkiaTextDecoration class >> primCreate [
	^ self ffiCall: #(void* skia_paragraph_decoration_default())
]

{ #category : 'private - ffi' }
SkiaTextDecoration class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_paragraph_decoration_drop(void** aHandle))
]

{ #category : 'accessing' }
SkiaTextDecoration >> color [
	^ SkiaColor fromNativeHandle: (self primGetColor)
]

{ #category : 'accessing' }
SkiaTextDecoration >> color: aColor [
	self primSetColor: (aColor pixelValueForDepth: 32)
]

{ #category : 'gt-extension' }
SkiaTextDecoration >> gtInfoFor: aView [
	<gtView>

	^ ({
		#type -> self type.
		#color -> self color.
		#thickness -> self thickness.
		#style -> self style.
		#mode -> self mode
	 } asOrderedDictionary gtItemsFor: aView)
			title: 'Info';
			priority: 2
]

{ #category : 'accessing' }
SkiaTextDecoration >> mode [
	^ self primGetMode
]

{ #category : 'accessing' }
SkiaTextDecoration >> mode: aSkiaTextDecorationMode [
	self primSetMode: aSkiaTextDecorationMode
]

{ #category : 'private - ffi' }
SkiaTextDecoration >> primGetColor [
	^ self ffiCall: #(void* skia_paragraph_decoration_get_color(self))
]

{ #category : 'private - ffi' }
SkiaTextDecoration >> primGetMode [
	^ self ffiCall: #(SkiaTextDecorationMode skia_paragraph_decoration_get_mode(self))
]

{ #category : 'private - ffi' }
SkiaTextDecoration >> primGetStyle [
	^ self ffiCall: #(SkiaTextDecorationStyle skia_paragraph_decoration_get_style(self))
]

{ #category : 'private - ffi' }
SkiaTextDecoration >> primGetThickness [
	^ self ffiCall: #(scalar skia_paragraph_decoration_get_thickness(self))
]

{ #category : 'private - ffi' }
SkiaTextDecoration >> primGetType [
	^ self ffiCall: #(uint32 skia_paragraph_decoration_get_type(self))
]

{ #category : 'private - ffi' }
SkiaTextDecoration >> primSetColor: aColorValue [
	^ self ffiCall: #(void skia_paragraph_decoration_set_color(self, uint32 aColorValue))
]

{ #category : 'private - ffi' }
SkiaTextDecoration >> primSetMode: aSkiaTextDecorationMode [
	^ self ffiCall: #(void skia_paragraph_decoration_set_mode(self, SkiaTextDecorationMode aSkiaTextDecorationMode))
]

{ #category : 'private - ffi' }
SkiaTextDecoration >> primSetStyle: aSkiaTextDecorationStyle [
	^ self ffiCall: #(void skia_paragraph_decoration_set_style(self, SkiaTextDecorationStyle aSkiaTextDecorationStyle))
]

{ #category : 'private - ffi' }
SkiaTextDecoration >> primSetThickness: aNumber [
	^ self ffiCall: #(void skia_paragraph_decoration_set_thickness(self, scalar aNumber))
]

{ #category : 'private - ffi' }
SkiaTextDecoration >> primSetType: aType [
	^ self ffiCall: #(void skia_paragraph_decoration_set_type(self, uint32 aType))
]

{ #category : 'accessing' }
SkiaTextDecoration >> style [
	^ self primGetStyle
]

{ #category : 'accessing' }
SkiaTextDecoration >> style: aSkiaTextDecorationStyle [
	self primSetStyle: aSkiaTextDecorationStyle
]

{ #category : 'accessing' }
SkiaTextDecoration >> thickness [
	^ self primGetThickness
]

{ #category : 'accessing' }
SkiaTextDecoration >> thickness: aNumber [
	self primSetThickness: aNumber
]

{ #category : 'accessing' }
SkiaTextDecoration >> type [
	^ self primGetType
]

{ #category : 'accessing' }
SkiaTextDecoration >> type: aNumber [
	self primSetType: aNumber
]

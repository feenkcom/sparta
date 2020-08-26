Class {
	#name : #SkiaParagraphTextStyle,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaParagraphTextStyle class >> primCreate [
	^ self ffiCall: #(void* skia_paragraph_text_style_new())
]

{ #category : #'private - ffi' }
SkiaParagraphTextStyle class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_paragraph_text_style_drop(void* aHandle))
]

{ #category : #accessing }
SkiaParagraphTextStyle >> background [
	^ SkiaPaint fromNativeHandle: self primGetBackground
]

{ #category : #accessing }
SkiaParagraphTextStyle >> background: aSkiaPaint [
	self primSetBackground: aSkiaPaint
]

{ #category : #accessing }
SkiaParagraphTextStyle >> color [
	^ SkiaColor
		fromNativeHandle: self primGetColor
		during: [ :aSkiaColor | aSkiaColor asColor ]
]

{ #category : #accessing }
SkiaParagraphTextStyle >> color: aColor [
	SkiaColor
		fromColor: aColor
		during: [ :aSkiaColor | self primSetColor: aSkiaColor ]
]

{ #category : #accessing }
SkiaParagraphTextStyle >> fontSize [
	^ self primGetFontSize
]

{ #category : #accessing }
SkiaParagraphTextStyle >> foreground [
	^ SkiaPaint fromNativeHandle: self primGetForeground
]

{ #category : #accessing }
SkiaParagraphTextStyle >> foreground: aSkiaPaint [
	self primSetForeground: aSkiaPaint
]

{ #category : #'gt-extension' }
SkiaParagraphTextStyle >> gtInfoFor: aView [
	<gtView>

	^ ({
		#fontSize -> self fontSize.
		#wordSpacing -> self wordSpacing.
		#letterSpacing -> self letterSpacing.
		#color -> self color.
	 } asOrderedDictionary gtItemsFor: aView)
			title: 'Info';
			priority: 2
]

{ #category : #accessing }
SkiaParagraphTextStyle >> letterSpacing [
	^ self primGetLetterSpacing
]

{ #category : #'private - ffi' }
SkiaParagraphTextStyle >> primGetBackground [
	^ self ffiCall: #(void* skia_paragraph_text_style_get_background(self))
]

{ #category : #'private - ffi' }
SkiaParagraphTextStyle >> primGetColor [
	^ self ffiCall: #(void* skia_paragraph_text_style_get_color(self))
]

{ #category : #'private - ffi' }
SkiaParagraphTextStyle >> primGetFontSize [
	^ self ffiCall: #(scalar skia_paragraph_text_style_get_font_size(self))
]

{ #category : #'private - ffi' }
SkiaParagraphTextStyle >> primGetForeground [
	^ self ffiCall: #(void* skia_paragraph_text_style_get_foreground(self))
]

{ #category : #'private - ffi' }
SkiaParagraphTextStyle >> primGetLetterSpacing [
	^ self ffiCall: #(scalar skia_paragraph_text_style_get_letter_spacing(self))
]

{ #category : #'private - ffi' }
SkiaParagraphTextStyle >> primGetWordSpacing [
	^ self ffiCall: #(scalar skia_paragraph_text_style_get_word_spacing(self))
]

{ #category : #'private - ffi' }
SkiaParagraphTextStyle >> primSetBackground: aSkiaPaint [
	^ self ffiCall: #(void skia_paragraph_text_style_set_background(self, SkiaPaint aSkiaPaint))
]

{ #category : #'private - ffi' }
SkiaParagraphTextStyle >> primSetColor: aSkiaColor [
	^ self ffiCall: #(void skia_paragraph_text_style_set_color(self, SkiaColor aSkiaColor))
]

{ #category : #'private - ffi' }
SkiaParagraphTextStyle >> primSetForeground: aSkiaPaint [
	^ self ffiCall: #(void skia_paragraph_text_style_set_foreground(self, SkiaPaint aSkiaPaint))
]

{ #category : #accessing }
SkiaParagraphTextStyle >> wordSpacing [
	^ self primGetWordSpacing
]

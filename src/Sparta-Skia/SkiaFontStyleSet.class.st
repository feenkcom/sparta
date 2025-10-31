Class {
	#name : #SkiaFontStyleSet,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaFontStyleSet class >> primCreate [
	^ self ffiCall: #(void* skia_font_style_set_default())
]

{ #category : #'private - ffi' }
SkiaFontStyleSet class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_font_style_set_drop(void* aHandle))
]

{ #category : #accessing }
SkiaFontStyleSet >> fontStyleAt: anIndex [
	<return: #SkiaFontStyle>

	^ SkiaFontStyle fromNativeHandle: (self primFontStyleAt: anIndex - 1)
]

{ #category : #accessing }
SkiaFontStyleSet >> fontStyleNameAt: anIndex [
	<return: #String>
	
	^ self ffiLibrary getStringFrom: [ :aStringBox | self primStyleName: aStringBox at: anIndex - 1 ]
]

{ #category : #accessing }
SkiaFontStyleSet >> fontStylesWithNames [
	^ (1 to: self size) collect: [ :anIndex |
		(self fontStyleAt: anIndex) -> (self fontStyleNameAt: anIndex) ]
]

{ #category : #accessing }
SkiaFontStyleSet >> gtFontStylesFor: aView [
	<gtView>
	
	^ aView columnedList
		title: 'Styles' translated;
		priority: 10;
		items: [ self fontStylesWithNames withIndexCollect: [ :eachAssociation :anIndex | { anIndex . eachAssociation } ]  ];
		column: 'Name' text: [ :each | each second value ] width: 100;
		column: 'Weight' text: [ :each | each second key weight ] width: 50;
		column: 'Slant' text: [ :each | each second key slant item ] width: 100;
		column: 'Width' text: [ :each | each second key width item ] width: 100;
		column: 'Preview' icon: [ :each | 
			((SkiaFont typeface: (self typefaceAt: each first) clone size: 100) asPreviewElementFor: 'glamorous toolkit') asScalableElement height: 30
		] weight: 1;
		send: [ :each | self typefaceAt: each first ]
]

{ #category : #'private - ffi' }
SkiaFontStyleSet >> primCount [
	^ self ffiCall: #(size_t skia_font_style_set_count(self))
]

{ #category : #'private - ffi' }
SkiaFontStyleSet >> primFontStyleAt: anIndex [
	^ self ffiCall: #(void* skia_font_style_set_style_at(self, size_t anIndex))
]

{ #category : #'private - ffi' }
SkiaFontStyleSet >> primNewTypefaceAt: anIndex [
	^ self ffiCall: #(void* skia_font_style_set_new_typeface(self, size_t anIndex))
]

{ #category : #'private - ffi' }
SkiaFontStyleSet >> primStyleName: aGtBoxerString at: anIndex [
	^ self ffiCall: #(void skia_font_style_set_name_at(self, size_t anIndex, GtBoxerString aGtBoxerString))
]

{ #category : #accessing }
SkiaFontStyleSet >> size [
	<return: #Number>

	^ self primCount
]

{ #category : #accessing }
SkiaFontStyleSet >> typefaceAt: anIndex [
	<return: #SkiaTypeface>
	
	^ SkiaTypeface fromNativeHandle: (self primNewTypefaceAt: anIndex - 1)
]

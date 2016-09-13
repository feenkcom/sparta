! SpartaTextPainter

I am a text painter.

!! Overview

I help developers to create, configure and execute text draw operation.
For that users of me must provide at least a font (backend specific, create using SpartaFontBuilder) to use and actual string to draw.
Additionally users may provide draw and stroke options as also specify how exactly string should be rendered: fill or stroke it.
It is also possible to choose if stroke should be rendered below fill or not.

!! Public API and Key Messages

- ==font:== - set a font that should be used to render a string
- ==string:== - set string to render
- ==baseline:== - set baseline location where string should be rendered
- ==fill== - string should be filled (default mode)
- ==stroke== - stroke string
- ==strokeBelow== - stroke should be rendered below fill
- ==drawOptions:== - set custom draw options (alpha, composition mode, antialias)
- ==strokeOptions:== - set custom stroke options (stroke width, other stroke related parameters)

!! Example:

First we need to create a font group, in this case of generic type *sans-serif*:
[[[language=smalltalk
font := canvas font
  size: 28;
  weightThin;
  sansSerif;
  build.
]]]

Use created font group to render multi-language text:
[[[language=smalltalk
canvas text
  string: 'Sparta Спарта 斯巴達 سپارٹا ස්පාටා';
  font: font;
  baseline: 20@40;
  draw;
  string: '😂🙈🚀'
  origin: 20@70;
  draw.
]]]
+https://github.com/syrel/Sparta/raw/documentation/images/SpartaTextPainter/01_multilanguage.png|label=multilanguage+

!! Internal Representation and Key Implementation Points.

!!! Instance Variables

- color: ==<Object>==
- drawOptions: ==<TSpartaDrawOptions>==
- font: ==<Object>==
- baseline: ==<Point>==
- string: ==<String>==
- strokeOptions: ==<TSpartaStrokeOptions>==

!!! Implementation Points

Font to use is backend specific. It must be created using SpartaFontBuilder.

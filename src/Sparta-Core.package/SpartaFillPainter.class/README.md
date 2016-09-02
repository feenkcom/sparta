# SpartaFillPainter
I represent a fill path operation builder - a concerete type of paint-path draw operation.

## Overview
I define an abstract api that all fill painters should provide. I am a final step in path-paint double dispatch and implement all fill draw related methods. As optimisation I have separate methods to fill rectangle and path with color, linear and radial gradients as also with surface. Backend may implement every method differently, add more dispatch stages or provide a single uniform method.

I am instantiated and pre-configured by [`SpartaCanvas`](../SpartaCanvas.class/README.md). Do  not create instances of me directly, instead use canvas as service provider. This way reference to my class will not be hardcoded  which increases flexibility.

## Public API and Key Messages

- `paint:` - set an object to be used as paint (can be `Color`, [`SpartaCanvas`](../SpartaCanvas.class/README.md), `SpartaSurface`, [`TSpartaPaint`](../TSpartaPaint.trait/README.md))
- `path:` - set path to be filled (can be `TSpartaPath` or `Rectangle`)
- `draw` - perform fill operation with previously configured parameters and options

## Example: 

Fill the whole canvas with white color:
```smalltalk
canvas fill
	paint: Color white;
	path: canvas bounds;
	draw.
```

Fill ellipse within rectangle (0@0 extent: 400@100) with pharo logo picture:
```smalltalk
canvas fill
	paint: (PolymorphSystemSettings pharoLogoForm);
	path: (canvas shape ellipse: (0@0 extent: 400@100));
	draw.
```
![Pharo logo](/images/SpartaFillPainter/01_pharo_logo.png)

## Internal Representation and Key Implementation Points.

Concrete backend implementations should subclass me directly, I was never ment to be an external object.

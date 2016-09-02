# SpartaStrokePainter
I represent a stroke path operation builder - a concerete type of paint-path draw operation.

## Overview
I define an abstract api that all stroke painters should provide.
I am a final step in path-paint double dispatch and implement all stroke draw related methods.
As optimisation I have separate methods to stroke rectangle and path with color, linear and radial gradients as also with surface.
Backends may implement every method differently, add more dispatch stages or provide a single uniform method.

I am instantiated and pre-configured by [`SpartaCanvas`](../SpartaCanvas.class/README.md).
Do  not create instances of me directly, instead use canvas as service provider.
This way reference to my class will not be hardcoded which increases flexibility.

## Public API and Key Messages

- `paint:` - set an object to be used as paint (can be `Color`, [`SpartaCanvas`](../SpartaCanvas.class/README.md), `SpartaSurface`, [`TSpartaPaint`](../TSpartaPaint.trait/README.md))
- `path:` - set path to be stroked (can be `TSpartaPath` or `Rectangle`)
- `width:` - set stroke width (`Number` - integer or float)
- `dashOffset:` - set the location along a path where the dash of a stroke will begin. The higher the number, the further along the path the dashes will begin. (`Number` - integer or float)
- `dashPattern:` - define dashes using array representation in form {"fill" . "gap" . "fill" . "gap" }, for example #(20 30 50 40)
- `draw` - perform stroke operation with previously configured parameters and options

## Example: 

Fill the whole canvas with white color:
```smalltalk
gradient := canvas paint linearGradient
  begin: 50@25;
  end: 300@200;
  stops: { 0 -> Color red . 1 -> Color blue }.
	
canvas stroke
  paint: gradient;
  path: (50@25 extent: 300@200);
  width: 16;
  dashOffset: 12.5;
  dashPattern: #(25);
  capRound;
  draw.
```
![Stroke example](/images/SpartaStrokePainter/01_stroke_dash_gradient.png)

## Internal Representation and Key Implementation Points.

Concrete backend implementations should subclass me directly, I was never meant to be an external object.

# SpartaCanvas
I represent a Sparta canvas and provide an API to perform various drawing operations.
I define an abstract API of Sparta canvas that all concrete implementations must have.

## Overview
My main responsibility is to create and provide backend specific builders and various objects.

In order to create and perform a drawing operation users should rely on corresponding builder.
For example if one wants to fill a path with a paint she needs to send #fill message to canvas to get a fill builder (painter).

There is a separate builder for every single operation. They can be found in "api" protocol.

I'm also responsible for creation of filter primitives (filter types) that are used with "filter" operation.
They can be found in "filters" protocol.

I am polymorphic with SpartaSurface.

## Public API and Key Messages

- `fill` - create a builder of fill drawing operation  
- `stroke` - create a builder of stroke drawing operation
- `path` - create a path builder
- `paint` - create a paint builder (linear, radial gradients)
- `clip` - create a builder to clip canvas by path (or rectangle)
- `transform` - create a builder to transform canvas
- `font` - create a font build helper
- `text` - create a text rendering builder
- `filter` - create a builder of filter drawing operation
- `mask` - create a builder of masking draw operation
- `bitmap` - create a bitmap factory
- `shape `- create a common shapes factory (ellipse, rounded rectangle, etc)
- `filters` - create a common filters factory

- `extent` - get my size (width@height)
- `similar:` - to create an empty canvas of size anExtent and of the same type and format 
- `asForm` - to rasterize myself and return resulting image as Form

*I am an abstract class and should not be instantiated. However, the best way to create an instance of sparta canvas is to send extent: message.*

## Example:

Create an empty canvas of size 400@250:
```
canvas := SpartaCanvas extent: 400@250.
 ```
![Empty canvas](/images/SpartaCanvas/01_empty.png)
 
Create a triangle vector path:
```
triangle := canvas path
	moveTo: 100@0;
	lineTo: 200@200;
	lineTo: 0@200;
	close;
	finish.
```
![Triangle path](/images/SpartaCanvas/02_triangle_path.png)

Create a linear gradient:
```
linearGradient := canvas paint linearGradient
	begin: 50@100;
	end: 150@200;
	stops: { 0 -> Color red. 1 -> Color blue }.
```

Apply translation to place trangle in the center:
```
canvas transform
	push;
	translateBy: 100@25;
	apply.
```

Fill previously created path fith linear gradient:
```
canvas fill
	paint: linearGradient;
	path: triangle;
	draw.
```
![Fill triangle path](/images/SpartaCanvas/03_fill_path.png)

Stroke triangle with blue color:
```
canvas stroke
	paint: Color blue;
	path: triangle;
	width: 6;
	draw.
```
![Stroke triangle path](/images/SpartaCanvas/04_stroke_path.png)

Restore transformation matrix:
```
canvas transform pop.
```

Create a gaussian blur filter:
```
blur := canvas gaussianBlurFilter
	stdDeviation: 4.
```

Apply filter on the whole canvas:
```
canvas filter
	area: canvas bounds;
	type: blue;
	draw.
```
![Blur canvas](/images/SpartaCanvas/05_blur.png)

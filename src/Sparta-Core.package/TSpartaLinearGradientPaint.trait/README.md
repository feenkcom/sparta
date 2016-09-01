# SpartaLinearGradient

I define an api of a linear gradient. Backend specific linear gradient must implement all my methods.

## Overview

I am responsible for setting `begin` and `end` of a linear gradient. They are defined as Points in user space coordiante system. I also add a few path-paint dispatch methods.

Linear gradients must be created using paint builder provided by canvas: `canvas paint linearGradient`

## Public API and Key Messages

- `begin:` - set a coordiante where linear gradient starts
- `end:` - set and end point of a gradient

## See
- [Paint](https://github.com/syrel/Sparta/blob/master/src/Sparta-Core.package/TSpartaPaint.trait/README.md)
- [Gradient](https://github.com/syrel/Sparta/blob/master/src/Sparta-Core.package/TSpartaGradientPaint.trait/README.md)
 - [Radial](https://github.com/syrel/Sparta/blob/master/src/Sparta-Core.package/TSpartaRadialGradientPaint.trait/README.md)
- [Canvas](https://github.com/syrel/Sparta/blob/master/src/Sparta-Core.package/SpartaCanvas.class/README.md)
- [Sparta](https://github.com/syrel/Sparta/blob/master/README.md)

## Example:

Simple gradient to fill rectangle (0@0 extent: 400@250):
```
canvas paint linearGradient
	stops: { 0 -> Color red  . 0.5 -> Color purple . 1 -> Color blue };
	begin: 0@0;
	end: 400@250.
```
![Simple linear gradient](https://github.com/syrel/Sparta/blob/master/images/TSpartaLinearGradientPaint/02_smooth_red_blue.png)

Complex gradient rotated by 45 degrees that reflects itself to fill rectangle (0@0 extent: 400@250):
```
canvas paint linearGradient
	stops: { 0 -> Color red . 0.5 -> Color green. 1 -> Color blue };
	begin: 0@0;
	end: 0@50; "define horizontal gradient"
	rotateByDegrees: 45;
	reflect.
```
![Advanced gradient](https://github.com/syrel/Sparta/blob/master/images/TSpartaLinearGradientPaint/01_red_blue.png)

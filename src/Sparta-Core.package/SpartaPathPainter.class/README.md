#SpartaPathPainter
I am a root builder class of operations involving path and paint. Two typical ones are fill or stroke.

## Overview

While building any paint-path related operations user must specify path and paint to use.

I am instantiated by canvas and used to build paint-path related drawing operations. Draw options are optional.

## Public API and Key Messages

- `paint:` - set a SpartaPaint or any other object implementing asSpartaPaintOn: as paint to perform operation with. Typically, basic Kernel related objects (e.g. Color or Form) or SpartaSurface and SpartaCanvas can be used directly as paints. Concrete backend implementations may optimize rendering depending on paint type.
- `path:` - set a SpartaPath or any other object implementing asSpartaPathOn: as path to to perform operation with. Typically, simple Kernel geometry objects (e.g. Rectangle) are polymoprhic with SpartaPath and can be used directly. Concrete backend implementation may do a dispatch to optimize rendering depending on path type.
- `drawOptions:` - set a custom draw options object to use while performing corresponding draw operation. Draw options define an alpha value [0 .. 1] to use, a composition operator or antialias mode.
 
## Internal Representation and Key Implementation Points.

###Instance Variables
- drawOptions: `<TSpartaDrawOptions>`
- paint: `<TSpartaPaint>`
- path:	`<TSpartaPath>`


### Implementation Points
 
   I am an abstract class and can not be used directly. See my subclasses for examples.

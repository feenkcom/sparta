I am a root builder class of operations involving path and pain. Two typical ones are fill or stroke.

While building any paint-path related operations user must specify path and paint to use.

I am instantiated by canvas and used to build paint-path related drawing operations.

Public API and Key Messages

- paint: set a SpartaPaint or any other object implementing asSpartaPaintOn: as paint to perform operation with. Typically, basic Kernel rendering related objects (e.g. Color or Form) or SpartaSurface or SpartaCanvas can be used directly as a paint. Concrete backend implementation may optimize rendering against them.
- path: set a SpartaPath or any other object implementing asSpartaPathOn: as path to to perform operation with. Typically, simple Kernel geometry objects (e.g. Rectangle) are polymoprhic with SpartaPath and can be used directly. Concrete backend implementation may do a dispatch to optimize rendering against them.
- drawOptions: set a custom draw options object to use while performing corresponding draw operation. Draw options for instance define an alpha value (0 .. 1) to use, a composition mode or antialias. If not set a default draw options are used.

   I an abstract class and can not be used. See my subclasses for examples.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	drawOptions:		<TSpartaDrawOptions>
	paint:		<TSpartaPaint>
	path:		<TSpartaPath>


    Implementation Points
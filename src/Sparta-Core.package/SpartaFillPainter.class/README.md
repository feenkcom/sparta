I represent a fill path operation builder - a concerete type of paint-path draw operations.

I define an abstract api that all fill builders should provide. I am a final step in path-paint double dispatch and implement all fill draw related methods. As optimisation I have separate methods to fill rectangle and path with color, linear and radial gradients as also with surface. Backend may implement every method differently, add more dispatch stages or provide a single uniform method.

I am instantiated and pre-configured by SpartaCanvas. Do  not create instances of me directly, instead use canvas as service provider. This way reference to my class will not be hardcoded  which increases flexibility.

Public API and Key Messages

- draw - actually performs fill operation with previous configured parameters and options

Example: 

canvas fill
	paint: Color white;
	path: canvas bounds;
	draw.

canvas fill
	paint: (PolymorphSystemSettings pharoLogoForm);
	path: (canvas shape ellipse: (0@0 extent: 400@100));
	drawOptions: (canvas drawOptions
		alpha: 0.5;
		antialiasNone;
		composeXor);
	draw.
 
Internal Representation and Key Implementation Points.

    Concrete backend implementations should subclass me directly, I was never ment to be an external object.
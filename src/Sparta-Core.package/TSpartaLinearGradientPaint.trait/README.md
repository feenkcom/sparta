I define an api of a linear gradient. Backend specific linear gradient must use me and must implement all my methods.

I am responsible for setting begin and end of a linear gradients. They are define as Point in user space coordiante system. I am also add a few paint-paint dispatch methods.

Linear gradients must be created using a paint builder provided by canvas.

Public API and Key Messages

- begin: set a coordiante where linear gradient starts
- end: set and end point of a gradient

   canvas paint linearGradient
	stops: { 0 -> Color red . 0.5 -> Color green. 1 -> Color blue };
	begin: 0@0;
	end: 0@50; "define horizontal gradient"
	rotateByDegrees: 45;
	reflect.
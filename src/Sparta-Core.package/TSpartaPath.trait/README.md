I am a path used to create (sets of) figures of any shape that can be filled or stroked to a canvas.
I can also be used to clip a region on the canvas.

Path is usually backend specific and has to be created using PathBuilder which can be optained from canvas.

Public API and Key Messages

- bounds - get  my bounds
- strokedBounds - get bounds of the stroke if I would be stroked with provided stroke options
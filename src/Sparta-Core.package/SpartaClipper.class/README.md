! SpartaClipper

I provide support of clipping.

!! Overview

My responsibility is to keep track of clipping region and allow developers to push or pop.
I support clipping by Rectangle or SpartaPath

!! Public API and Key Messages

- ==by:during:== - clips by a path or rectangle while performing a closure, once done restores previous clipping region. Takes care about possible unhandled exceptions within a block.
- ==push:== clips by a path or rectangle. Every push: must be balanced with pop to restore clipping region.
- ==pop== - balances push: and restores clipping region to its previous state

!! Example:

Error robust implementation with the help of block closures:
[[[language=smalltalk
canvas clip
   by: (0@0 extent: 100@100)
   during: [ "draw here" ]
]]]

Or developers can balance push:/pop manually:
[[[language=smalltalk
ellipse := canvas shape ellipse: (0@0 extent: 100@100).
canvas clip push: ellipse.
"draw here"
canvas clip pop.
]]]

!! Internal Representation and Key Implementation Points.

Subclasses must implement pushRectangle: pushPath: and pop

"
1. SpartaAbstractPainter
I am a root class of all draw operation builders.

1. # Overview

Since I am responsible for drawing on canvas my name is Painter :)

As soon as draw operation is configured it should be performed sending `#draw` message

1. # Public API and Key Messages


- `draw` - perform a corresponding draw operation
 
1. # Internal Representation and Key Implementation Points.

Painters are supposed to be backend specific


"
Class {
	#name : #SpartaAbstractPainter,
	#superclass : #SpartaAbstractBuilder,
	#category : #'Sparta-Core-Builders'
}

{ #category : #drawing }
SpartaAbstractPainter >> draw [
	self subclassResponsibility
]

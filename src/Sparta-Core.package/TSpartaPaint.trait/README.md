I define an API of a Paint. Backend specific paints  should use me and provide concrete implemenations of all my methods.

A paint is transformable and can be used with one of extend modes, for example repeat, reflect or clamp.

I am instantiated by canvas and does not supposed to be created by refering paint class directly.
Sparta canvas provides a paint builder that should be used to build concerete paints.

Public API and Key Messages

- transformation - to get current transformation matrix, can not be nil
- transformation: set new paint transformation. If not set, supposed to be identity.
- clamp - do not repeat me
- reflect - mirror the image
- repeat - repeat in both X and Y axis
- repeatX - repeat only X axis
- repeatY - repeat only Y axis
- rotateByDegrees: rotate me by amount of degrees clockwise
- rotateByRadians: rotate me by amount of radians clockwise
- scaleBy: scale me by a factor, a Point or a number.
- translateBy: translate me by a Point or a number

    I define an api of an abstract paint.
 
Internal Representation and Key Implementation Points.


    Generally, a Paint is not meant to be an external object, however for additional flexibility I am implemented as Trait
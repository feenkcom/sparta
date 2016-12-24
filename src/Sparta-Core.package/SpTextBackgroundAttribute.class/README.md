I represent a text background attribute.
I am used together with SpRope and SpText to style text.

Public API and Key Messages

- paint: set background paint

Example:

	SpTextBackgroundAttribute paint: Color yellow
 
Internal Representation and Key Implementation Points.

    Instance Variables
	paint:		<Object> can be a Color, Pattern, Gradient. Basically anything that implements TSpartaPaint or polymorphic with it
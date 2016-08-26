I am a root class for all sparta builders.
All builders must be only created and managed by canvas.

Every builder provides a way to reset resources to enable reuse of builders instead of their recreation on every access.

Public API and Key Messages

- canvas - return currently associated canvas 
- canvas: set canvas to which builder should be associated
- reset - to reset and clean used resources

Internal Representation and Key Implementation Points.

    Instance Variables
	canvas:		<SpartaCanvas> - associated sparta canvas


    Implementation Points

	Builders may or may not be backend specific
I represent a mozilla::gfx::Pattern structure.

This is the base class for 'patterns'. Patterns describe the pixels used as the source for a masked composition operation that is done by the different drawing commands.
These objects are not backend specific, however for example the gradient stops on a gradient pattern can be backend specific.

Public API and Key Messages

- asForm - to render a preview of me on sparta canavas

Internal Representation and Key Implementation Points.

	I am sent by value to all DrawTarget methods therefore need to be freed when not needed
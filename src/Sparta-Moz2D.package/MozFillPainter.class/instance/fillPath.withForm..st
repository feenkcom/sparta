drawing
fillPath: aPath withForm: aForm
	| form |

	form := aForm unhibernate; asFormOfDepth: 32.
	self
		primFillPath: aPath
		bits: form bits
		formWidth: form width
		formHeight: form height
		stride: form stride
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
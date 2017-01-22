actions
preLoadActions: aSpecLoader
	| aDirective |
	"Extract requested group from spec loader to work with during loading"

	group := self groupOf: aSpecLoader.

	self hasDirective
		ifFalse: [ ^ self ].
	aDirective := self directive.
	"let's ensure that we have iceberg before loading packages iceberg"
	aDirective = #git
		ifTrue: [ self ensureIceberg ]
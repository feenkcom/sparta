accessing
systemInfo
	| delimiter image vm stack |

	delimiter := 'System information: ', String cr, '---------------' asText.
	image := 'Pharo ', SystemVersion current dottedMajorMinor,  String cr, SmalltalkImage current lastUpdateString.
	vm := String streamContents: [ :aStream | SystemReporter new reportVM: aStream ].
	stack := 'Stack trace:', String cr, '---------------', String cr, self stack printString.

	^
		delimiter,
		String cr, image,
 		String cr, String cr, vm,
		String cr, String cr, stack
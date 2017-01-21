layer
during: aBlock
	[ dictionary := Dictionary new.
	link := MetaLink new
		metaObject: [ :aClass :aContext | MozNewCounter count: aClass sender: aContext sender sender ];
		selector: #value:value:;
		arguments: #(#class context).
	(Behavior >> #basicNew) ast link: link.
	count := true.
	aBlock value ]
		ensure: [
			count := false.
			(Behavior >> #basicNew) ast removeLink: link.
			self sort ].
	^ dictionary
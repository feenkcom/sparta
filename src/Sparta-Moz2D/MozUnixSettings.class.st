Class {
	#name : #MozUnixSettings,
	#superclass : #MozSettings,
	#category : 'Sparta-Moz2D-Preferences'
}

{ #category : #configuration }
MozUnixSettings class >> defaultPreferences [
	^ #(
		
		'gfx.font_rendering.fontconfig.fontlist.enabled' true
		'gfx.font_rendering.fontconfig.max_generic_substitutions' 3
		
		"font names"

		'font.name.serif.ar' 'serif'
		'font.name.sans-serif.ar' 'sans-serif'
		'font.name.monospace.ar' 'monospace'
		'font.size.fixed.ar' 12

		'font.name.serif.el' 'serif'
		'font.name.sans-serif.el' 'sans-serif'
		'font.name.monospace.el' 'monospace'
		'font.size.fixed.el' 12

		'font.name.serif.he' 'serif'
		'font.name.sans-serif.he' 'sans-serif'
		'font.name.monospace.he' 'monospace'
		'font.size.fixed.he' 12

		'font.name.serif.ja' 'serif'
		'font.name.sans-serif.ja' 'sans-serif'
		'font.name.monospace.ja' 'monospace'

		'font.name.serif.ko' 'serif'
		'font.name.sans-serif.ko' 'sans-serif'
		'font.name.monospace.ko' 'monospace'

		'font.name.serif.th' 'serif'
		'font.name.sans-serif.th' 'sans-serif'
		'font.name.monospace.th' 'monospace'
		'font.minimum-size.th' 13

		'font.name.serif.x-armn' 'serif'
		'font.name.sans-serif.x-armn' 'sans-serif'
		'font.name.monospace.x-armn' 'monospace'

		'font.name.serif.x-beng' 'serif'
		'font.name.sans-serif.x-beng' 'sans-serif'
		'font.name.monospace.x-beng' 'monospace'

		'font.name.serif.x-cans' 'serif'
		'font.name.sans-serif.x-cans' 'sans-serif'
		'font.name.monospace.x-cans' 'monospace'

		'font.name.serif.x-cyrillic' 'serif'
		'font.name.sans-serif.x-cyrillic' 'sans-serif'
		'font.name.monospace.x-cyrillic' 'monospace'
		'font.size.fixed.x-cyrillic' 12

		'font.name.serif.x-devanagari' 'serif'
		'font.name.sans-serif.x-devanagari' 'sans-serif'
		'font.name.monospace.x-devanagari' 'monospace'

		'font.name.serif.x-ethi' 'serif'
		'font.name.sans-serif.x-ethi' 'sans-serif'
		'font.name.monospace.x-ethi' 'monospace'

		'font.name.serif.x-geor' 'serif'
		'font.name.sans-serif.x-geor' 'sans-serif'
		'font.name.monospace.x-geor' 'monospace'

		'font.name.serif.x-gujr' 'serif'
		'font.name.sans-serif.x-gujr' 'sans-serif'
		'font.name.monospace.x-gujr' 'monospace'

		'font.name.serif.x-guru' 'serif'
		'font.name.sans-serif.x-guru' 'sans-serif'
		'font.name.monospace.x-guru' 'monospace'

		'font.name.serif.x-khmr' 'serif'
		'font.name.sans-serif.x-khmr' 'sans-serif'
		'font.name.monospace.x-khmr' 'monospace'

		'font.name.serif.x-knda' 'serif'
		'font.name.sans-serif.x-knda' 'sans-serif'
		'font.name.monospace.x-knda' 'monospace'

		'font.name.serif.x-mlym' 'serif'
		'font.name.sans-serif.x-mlym' 'sans-serif'
		'font.name.monospace.x-mlym' 'monospace'

		'font.name.serif.x-orya' 'serif'
		'font.name.sans-serif.x-orya' 'sans-serif'
		'font.name.monospace.x-orya' 'monospace'

		'font.name.serif.x-sinh' 'serif'
		'font.name.sans-serif.x-sinh' 'sans-serif'
		'font.name.monospace.x-sinh' 'monospace'

		'font.name.serif.x-tamil' 'serif'
		'font.name.sans-serif.x-tamil' 'sans-serif'
		'font.name.monospace.x-tamil' 'monospace'

		'font.name.serif.x-telu' 'serif'
		'font.name.sans-serif.x-telu' 'sans-serif'
		'font.name.monospace.x-telu' 'monospace'

		'font.name.serif.x-tibt' 'serif'
		'font.name.sans-serif.x-tibt' 'sans-serif'
		'font.name.monospace.x-tibt' 'monospace'

		'font.name.serif.x-unicode' 'serif'
		'font.name.sans-serif.x-unicode' 'sans-serif'
		'font.name.monospace.x-unicode' 'monospace'
		'font.size.fixed.x-unicode' 12

		'font.name.serif.x-western' 'serif'
		'font.name.sans-serif.x-western' 'sans-serif'
		'font.name.monospace.x-western' 'monospace'
		'font.size.fixed.x-western' 12

		'font.name.serif.zh-CN' 'serif'
		'font.name.sans-serif.zh-CN' 'sans-serif'
		'font.name.monospace.zh-CN' 'monospace'

		'font.name.serif.zh-HK' 'serif'
		'font.name.sans-serif.zh-HK' 'sans-serif'
		'font.name.monospace.zh-HK' 'monospace'

		'font.name.serif.zh-TW' 'serif'
		'font.name.sans-serif.zh-TW' 'sans-serif'
		'font.name.monospace.zh-TW' 'monospace'
	)
]

{ #category : #settings }
MozUnixSettings class >> parentPreferencesGroup [
	^ 'Moz2D'
]

{ #category : #settings }
MozUnixSettings class >> preferencesGroup [
	^ 'Unix'
]

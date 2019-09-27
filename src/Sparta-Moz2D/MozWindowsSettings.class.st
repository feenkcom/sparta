Class {
	#name : #MozWindowsSettings,
	#superclass : #MozSettings,
	#category : 'Sparta-Moz2D-Preferences'
}

{ #category : #configuration }
MozWindowsSettings class >> defaultPreferences [
	^ #(		
		'gfx.font_loader.delay' 120000
		'gfx.font_loader.interval' 1000
		
		'gfx.font_rendering.cleartype_params.gamma' -1
		'gfx.font_rendering.cleartype_params.enhanced_contrast' -1
		'gfx.font_rendering.cleartype_params.cleartype_level' -1
		'gfx.font_rendering.cleartype_params.pixel_structure' -1
		'gfx.font_rendering.cleartype_params.rendering_mode' -1
		
		'gfx.font_rendering.directwrite.force-enabled' false
		'gfx.font_rendering.directwrite.use_gdi_table_loading' true
		'gfx.font_rendering.cleartype_params.force_gdi_classic_for_families' 'Arial,Consolas,Courier New,Microsoft Sans Serif,Segoe UI,Tahoma,Trebuchet MS,Verdana'
		'gfx.font_rendering.cleartype_params.force_gdi_classic_max_size' 15
		
		'font.name.serif.ar' 'Times New Roman'
		'font.name.sans-serif.ar' 'Segoe UI'
		'font.name-list.sans-serif.ar' 'Segoe UI, Tahoma, Arial'
		'font.name.monospace.ar' 'Courier New'
		'font.name.cursive.ar' 'Comic Sans MS'

		'font.name.serif.el' 'Times New Roman'
		'font.name.sans-serif.el' 'Arial'
		'font.name.monospace.el' 'Courier New'
		'font.name.cursive.el' 'Comic Sans MS'

		'font.name.serif.he' 'Narkisim'
		'font.name.sans-serif.he' 'Arial'
		'font.name.monospace.he' 'Fixed Miriam Transparent'
		'font.name.cursive.he' 'Guttman Yad'
		'font.name-list.serif.he' 'Narkisim, David'
		'font.name-list.monospace.he' 'Fixed Miriam Transparent, Miriam Fixed, Rod, Courier New'
		'font.name-list.cursive.he' 'Guttman Yad, Ktav, Arial'

		'font.name.serif.ja' 'MS PMincho'
		'font.name.sans-serif.ja' 'MS PGothic'
		'font.name.monospace.ja' 'MS Gothic'
		'font.name-list.serif.ja' 'MS PMincho, MS Mincho, MS PGothic, MS Gothic,Meiryo'
		'font.name-list.sans-serif.ja' 'MS PGothic, MS Gothic, MS PMincho, MS Mincho,Meiryo'
		'font.name-list.monospace.ja' 'MS Gothic, MS Mincho, MS PGothic, MS PMincho,Meiryo'

		'font.name.serif.ko' 'Batang'
		'font.name.sans-serif.ko' 'Gulim'
		'font.name.monospace.ko' 'GulimChe'
		'font.name.cursive.ko' 'Gungsuh'

		'font.name-list.serif.ko' 'Batang, Gulim'
		'font.name-list.sans-serif.ko' 'Gulim'
		'font.name-list.monospace.ko' 'GulimChe'
		'font.name-list.cursive.ko' 'Gungsuh'

		'font.name.serif.th' 'Tahoma'
		'font.name.sans-serif.th' 'Tahoma'
		'font.name.monospace.th' 'Tahoma'
		'font.name.cursive.th' 'Tahoma'

		'font.name.serif.x-cyrillic' 'Times New Roman'
		'font.name.sans-serif.x-cyrillic' 'Arial'
		'font.name.monospace.x-cyrillic' 'Courier New'
		'font.name.cursive.x-cyrillic' 'Comic Sans MS'

		'font.name.serif.x-unicode' 'Times New Roman'
		'font.name.sans-serif.x-unicode' 'Arial'
		'font.name.monospace.x-unicode' 'Courier New'
		'font.name.cursive.x-unicode' 'Comic Sans MS'

		'font.name.serif.x-western' 'Times New Roman'
		'font.name.sans-serif.x-western' 'Arial'
		'font.name.monospace.x-western' 'Courier New'
		'font.name.cursive.x-western' 'Comic Sans MS'

		'font.name.serif.zh-CN' 'SimSun'
		'font.name.sans-serif.zh-CN' 'Microsoft YaHei'
		'font.name.monospace.zh-CN' 'SimSun'
		'font.name.cursive.zh-CN' 'KaiTi'
		'font.name-list.serif.zh-CN' 'MS Song, SimSun, SimSun-ExtB'
		'font.name-list.sans-serif.zh-CN' 'Microsoft YaHei, SimHei'
		'font.name-list.monospace.zh-CN' 'MS Song, SimSun, SimSun-ExtB'
		'font.name-list.cursive.zh-CN' 'KaiTi, KaiTi_GB2312'

		'font.name.serif.zh-TW' 'Times New Roman'
		'font.name.sans-serif.zh-TW' 'Arial'
		'font.name.monospace.zh-TW' 'MingLiU'
		'font.name.cursive.zh-TW' 'DFKai-SB'
		'font.name-list.serif.zh-TW' 'PMingLiu, MingLiU, MingLiU-ExtB'
		'font.name-list.sans-serif.zh-TW' 'PMingLiU, MingLiU, MingLiU-ExtB'
		'font.name-list.monospace.zh-TW' 'MingLiU, MingLiU-ExtB'

		'font.name.serif.zh-HK' 'Times New Roman'
		'font.name.sans-serif.zh-HK' 'Arial'
		'font.name.monospace.zh-HK' 'MingLiu_HKSCS'
		'font.name.cursive.zh-HK' 'DFKai-SB'
		'font.name-list.serif.zh-HK' 'MingLiu_HKSCS, Ming(for ISO10646), MingLiU, MingLiU_HKSCS-ExtB'
		'font.name-list.sans-serif.zh-HK' 'MingLiU_HKSCS, Ming(for ISO10646), MingLiU, MingLiU_HKSCS-ExtB'
		'font.name-list.monospace.zh-HK' 'MingLiU_HKSCS, Ming(for ISO10646), MingLiU, MingLiU_HKSCS-ExtB'

		'font.name.serif.x-devanagari' 'Kokila'
		'font.name.sans-serif.x-devanagari' 'Nirmala UI'
		'font.name.monospace.x-devanagari' 'Mangal'
		'font.name-list.serif.x-devanagari' 'Kokila, Raghindi'
		'font.name-list.sans-serif.x-devanagari' 'Nirmala UI, Mangal'
		'font.name-list.monospace.x-devanagari' 'Mangal, Nirmala UI'

		'font.name.serif.x-tamil' 'Latha'
		'font.name.sans-serif.x-tamil' ''
		'font.name.monospace.x-tamil' 'Latha'
		'font.name-list.serif.x-tamil' 'Latha'
		'font.name-list.monospace.x-tamil' 'Latha'

		'font.name.serif.x-armn' 'Sylfaen'
		'font.name.sans-serif.x-armn' 'Arial AMU'
		'font.name.monospace.x-armn' 'Arial AMU'
		'font.name-list.serif.x-armn' 'Sylfaen'
		'font.name-list.monospace.x-armn' 'Arial AMU'

		'font.name.serif.x-beng' 'Vrinda'
		'font.name.sans-serif.x-beng' 'Vrinda'
		'font.name.monospace.x-beng' 'Mitra Mono'
		'font.name-list.serif.x-beng' 'Vrinda, Akaash, Likhan, Ekushey Punarbhaba'
		'font.name-list.sans-serif.x-beng' 'Vrinda, Akaash, Likhan, Ekushey Punarbhaba'
		'font.name-list.monospace.x-beng' 'Likhan, Mukti Narrow'

		'font.name.serif.x-cans' 'Aboriginal Serif'
		'font.name.sans-serif.x-cans' 'Aboriginal Sans'
		'font.name.monospace.x-cans' 'Aboriginal Sans'
		'font.name-list.serif.x-cans' 'Aboriginal Serif, BJCree Uni'
		'font.name-list.monospace.x-cans' 'Aboriginal Sans, OskiDakelh, Pigiarniq, Uqammaq'

		'font.name.serif.x-ethi' 'Visual Geez Unicode'
		'font.name.sans-serif.x-ethi' 'GF Zemen Unicode'
		'font.name.cursive.x-ethi' 'Visual Geez Unicode Title'
		'font.name.monospace.x-ethi' 'Ethiopia Jiret'
		'font.name-list.serif.x-ethi' 'Visual Geez Unicode, Visual Geez Unicode Agazian'
		'font.name-list.monospace.x-ethi' 'Ethiopia Jiret'

		'font.name.serif.x-geor' 'Sylfaen'
		'font.name.sans-serif.x-geor' 'BPG Classic 99U'
		'font.name.monospace.x-geor' 'BPG Classic 99U'
		'font.name-list.serif.x-geor' 'Sylfaen, BPG Paata Khutsuri U, TITUS Cyberbit Basic'
		'font.name-list.monospace.x-geor' 'BPG Classic 99U'

		'font.name.serif.x-gujr' 'Shruti'
		'font.name.sans-serif.x-gujr' 'Shruti'
		'font.name.monospace.x-gujr' 'Shruti'
		'font.name-list.serif.x-gujr' 'Shruti'
		'font.name-list.monospace.x-gujr' 'Shruti'

		'font.name.serif.x-guru' 'Raavi'
		'font.name.sans-serif.x-guru' ''
		'font.name.monospace.x-guru' 'Raavi'
		'font.name-list.serif.x-guru' 'Raavi, Saab'
		'font.name-list.monospace.x-guru' 'Raavi, Saab'

		'font.name.serif.x-khmr' 'PhnomPenh OT'
		'font.name.sans-serif.x-khmr' 'Khmer OS'
		'font.name.monospace.x-khmr' 'Khmer OS'
		'font.name-list.serif.x-khmr' 'PhnomPenh OT,.Mondulkiri U GR 1.5, Khmer OS'
		'font.name-list.monospace.x-khmr' 'Khmer OS, Khmer OS System'

		'font.name.serif.x-mlym' 'Rachana_w01'
		'font.name.sans-serif.x-mlym' 'Rachana_w01'
		'font.name.monospace.x-mlym' 'Rachana_w01'
		'font.name-list.serif.x-mlym' 'AnjaliOldLipi, Kartika, ThoolikaUnicode'
		'font.name-list.sans-serif.x-mlym' 'AnjaliOldLipi, Kartika, ThoolikaUnicode'
		'font.name-list.monospace.x-mlym' 'AnjaliOldLipi, Kartika, ThoolikaUnicode'

		'font.name.serif.x-orya' 'ori1Uni'
		'font.name.sans-serif.x-orya' 'ori1Uni'
		'font.name.monospace.x-orya' 'ori1Uni'
		'font.name-list.serif.x-orya' 'Kalinga, ori1Uni'
		'font.name-list.sans-serif.x-orya' 'Kalinga, ori1Uni'
		'font.name-list.monospace.x-orya' 'Kalinga, ori1Uni'

		'font.name.serif.x-telu' 'Gautami'
		'font.name.sans-serif.x-telu' 'Gautami'
		'font.name.monospace.x-telu' 'Gautami'
		'font.name-list.serif.x-telu' 'Gautami, Akshar Unicode'
		'font.name-list.sans-serif.x-telu' 'Gautami, Akshar Unicode'
		'font.name-list.monospace.x-telu' 'Gautami, Akshar Unicode'

		'font.name.serif.x-knda' 'Tunga'
		'font.name.sans-serif.x-knda' 'Tunga'
		'font.name.monospace.x-knda' 'Tunga'
		'font.name-list.serif.x-knda' 'Tunga, AksharUnicode'
		'font.name-list.sans-serif.x-knda' 'Tunga, AksharUnicode'
		'font.name-list.monospace.x-knda' 'Tunga, AksharUnicode'

		'font.name.serif.x-sinh' 'Iskoola Pota'
		'font.name.sans-serif.x-sinh' 'Iskoola Pota'
		'font.name.monospace.x-sinh' 'Iskoola Pota'
		'font.name-list.serif.x-sinh' 'Iskoola Pota, AksharUnicode'
		'font.name-list.sans-serif.x-sinh' 'Iskoola Pota, AksharUnicode'
		'font.name-list.monospace.x-sinh' 'Iskoola Pota, AksharUnicode'

		'font.name.serif.x-tibt' 'Tibetan Machine Uni'
		'font.name.sans-serif.x-tibt' 'Tibetan Machine Uni'
		'font.name.monospace.x-tibt' 'Tibetan Machine Uni'
		'font.name-list.serif.x-tibt' 'Tibetan Machine Uni, Jomolhari, Microsoft Himalaya'
		'font.name-list.sans-serif.x-tibt' 'Tibetan Machine Uni, Jomolhari, Microsoft Himalaya'
		'font.name-list.monospace.x-tibt' 'Tibetan Machine Uni, Jomolhari, Microsoft Himalaya'

		'font.minimum-size.th' 10

		'font.default.x-devanagari' 'sans-serif'
		'font.name.serif.x-math' 'Latin Modern Math'
		'font.name-list.serif.x-math' 'Latin Modern Math, XITS Math, Cambria Math, Libertinus Math, DejaVu Math TeX Gyre, TeX Gyre Bonum Math, TeX Gyre Pagella Math, TeX Gyre Schola, TeX Gyre Termes Math, STIX Math, Asana Math, STIXGeneral, DejaVu Serif, DejaVu Sans, Symbol, Times New Roman'
		'font.name.sans-serif.x-math' 'Arial'
		'font.name.monospace.x-math' 'Courier New'
		'font.name.cursive.x-math' 'Comic Sans MS'
	)
]

{ #category : #settings }
MozWindowsSettings class >> parentPreferencesGroup [
	^ 'Moz2D'
]

{ #category : #settings }
MozWindowsSettings class >> preferencesGroup [
	^ 'Windows'
]

configuration
defaultPreferences
	^ #(
		'gfx.canvas.azure.backends' 'cg,skia'
		'gfx.content.azure.backends' 'cg,skia'
		
		"use Mac OS X Appearance panel text smoothing setting when rendering text, enabled by default"
		'gfx.use_text_smoothing_setting' true
		
		'font.name.serif.ar' 'Al Bayan'
		'font.name.sans-serif.ar' 'Geeza Pro'
		'font.name.monospace.ar' 'Geeza Pro'
		'font.name.cursive.ar' 'DecoType Naskh'
		'font.name.fantasy.ar' 'KufiStandardGK'
		'font.name-list.serif.ar' 'Al Bayan'
		'font.name-list.sans-serif.ar' 'Geeza Pro'
		'font.name-list.monospace.ar' 'Geeza Pro'
		'font.name-list.cursive.ar' 'DecoType Naskh'
		'font.name-list.fantasy.ar' 'KufiStandardGK'

		'font.name.serif.el' 'Times'
		'font.name.sans-serif.el' 'Helvetica'
		'font.name.monospace.el' 'Courier New'
		'font.name.cursive.el' 'Lucida Grande'
		'font.name.fantasy.el' 'Lucida Grande'
		'font.name-list.serif.el' 'Times,Times New Roman'
		'font.name-list.sans-serif.el' 'Helvetica,Lucida Grande'
		'font.name-list.monospace.el' 'Courier New,Lucida Grande'
		'font.name-list.cursive.el' 'Times,Lucida Grande'
		'font.name-list.fantasy.el' 'Times,Lucida Grande'

		'font.name.serif.he' 'Times New Roman'
		'font.name.sans-serif.he' 'Arial'
		'font.name.monospace.he' 'Courier New'
		'font.name.cursive.he' 'Times New Roman'
		'font.name.fantasy.he' 'Times New Roman'
		'font.name-list.serif.he' 'Times New Roman'
		'font.name-list.sans-serif.he' 'Arial'
		'font.name-list.monospace.he' 'Courier New'
		'font.name-list.cursive.he' 'Times New Roman'
		'font.name-list.fantasy.he' 'Times New Roman'

		'font.name.serif.ja' 'Hiragino Mincho ProN'
		'font.name.sans-serif.ja' 'Hiragino Kaku Gothic ProN'
		'font.name.monospace.ja' 'Osaka-Mono'
		'font.name-list.serif.ja' 'Hiragino Mincho ProN,Hiragino Mincho Pro'
		'font.name-list.sans-serif.ja' 'Hiragino Kaku Gothic ProN,Hiragino Kaku Gothic Pro'
		'font.name-list.monospace.ja' 'Osaka-Mono'

		'font.name.serif.ko' 'AppleMyungjo'
		'font.name.sans-serif.ko' 'Apple SD Gothic Neo'
		'font.name.monospace.ko' 'Apple SD Gothic Neo'
		'font.name-list.serif.ko' 'AppleMyungjo'
		'font.name-list.sans-serif.ko' 'Apple SD Gothic Neo,AppleGothic'
		'font.name-list.monospace.ko' 'Apple SD Gothic Neo,AppleGothic'

		'font.name.serif.th' 'Thonburi'
		'font.name.sans-serif.th' 'Thonburi'
		'font.name.monospace.th' 'Ayuthaya'
		'font.name-list.serif.th' 'Thonburi'
		'font.name-list.sans-serif.th' 'Thonburi'
		'font.name-list.monospace.th' 'Ayuthaya'

		'font.name.serif.x-armn' 'Mshtakan'
		'font.name.sans-serif.x-armn' 'Mshtakan'
		'font.name.monospace.x-armn' 'Mshtakan'
		'font.name-list.serif.x-armn' 'Mshtakan'
		'font.name-list.sans-serif.x-armn' 'Mshtakan'
		'font.name-list.monospace.x-armn' 'Mshtakan'

		"SolaimanLipi, Rupali http://ekushey.org/?page/mac_download"
		'font.name.serif.x-beng' 'Bangla MN'
		'font.name.sans-serif.x-beng' 'Bangla Sangam MN'
		'font.name.monospace.x-beng' 'Bangla Sangam MN'
		'font.name-list.serif.x-beng' 'Bangla MN'
		'font.name-list.sans-serif.x-beng' 'Bangla Sangam MN'
		'font.name-list.monospace.x-beng' 'Bangla Sangam MN'

		'font.name.serif.x-cans' 'Euphemia UCAS'
		'font.name.sans-serif.x-cans' 'Euphemia UCAS'
		'font.name.monospace.x-cans' 'Euphemia UCAS'
		'font.name-list.serif.x-cans' 'Euphemia UCAS'
		'font.name-list.sans-serif.x-cans' 'Euphemia UCAS'
		'font.name-list.monospace.x-cans' 'Euphemia UCAS'

		'font.name.serif.x-cyrillic' 'Times'
		'font.name.sans-serif.x-cyrillic' 'Helvetica'
		'font.name.monospace.x-cyrillic' 'Monaco'
		'font.name.cursive.x-cyrillic' 'Geneva'
		'font.name.fantasy.x-cyrillic' 'Charcoal CY'
		'font.name-list.serif.x-cyrillic' 'Times,Times New Roman'
		'font.name-list.sans-serif.x-cyrillic' 'Helvetica,Arial'
		'font.name-list.monospace.x-cyrillic' 'Monaco,Courier New'
		'font.name-list.cursive.x-cyrillic' 'Geneva'
		'font.name-list.fantasy.x-cyrillic' 'Charcoal CY'

		'font.name.serif.x-devanagari' 'Devanagari MT'
		'font.name.sans-serif.x-devanagari' 'Devanagari Sangam MN'
		'font.name.monospace.x-devanagari' 'Devanagari Sangam MN'
		'font.name-list.serif.x-devanagari' 'Devanagari MT'
		'font.name-list.sans-serif.x-devanagari' 'Devanagari Sangam MN,Devanagari MT'
		'font.name-list.monospace.x-devanagari' 'Devanagari Sangam MN,Devanagari MT'

		"Abyssinica SIL http://scripts.sil.org/AbyssinicaSIL_Download"
		'font.name.serif.x-ethi' 'Kefa'
		'font.name.sans-serif.x-ethi' 'Kefa'
		'font.name.monospace.x-ethi' 'Kefa'
		'font.name-list.serif.x-ethi' 'Kefa,Abyssinica SIL'
		'font.name-list.sans-serif.x-ethi' 'Kefa,Abyssinica SIL'
		'font.name-list.monospace.x-ethi' 'Kefa,Abyssinica SIL'

		"no suitable fonts for georgian ship with mac os x"
		"however some can be freely downloaded"
		"TITUS Cyberbit Basic http://titus.fkidg1.uni-frankfurt.de/unicode/tituut.asp"
		"Zuzumbo http://homepage.mac.com/rsiradze/FileSharing91.html"
		'font.name.serif.x-geor' 'TITUS Cyberbit Basic'
		'font.name.sans-serif.x-geor' 'Zuzumbo'
		'font.name.monospace.x-geor' 'Zuzumbo'
		'font.name-list.serif.x-geor' 'TITUS Cyberbit Basic'
		'font.name-list.sans-serif.x-geor' 'Zuzumbo'
		'font.name-list.monospace.x-geor' 'Zuzumbo'

		'font.name.serif.x-gujr' 'Gujarati MT'
		'font.name.sans-serif.x-gujr' 'Gujarati Sangam MN'
		'font.name.monospace.x-gujr' 'Gujarati Sangam MN'
		'font.name-list.serif.x-gujr' 'Gujarati MT'
		'font.name-list.sans-serif.x-gujr' 'Gujarati Sangam MN,Gujarati MT'
		'font.name-list.monospace.x-gujr' 'Gujarati Sangam MN,Gujarati MT'

		'font.name.serif.x-guru' 'Gurmukhi MT'
		'font.name.sans-serif.x-guru' 'Gurmukhi MT'
		'font.name.monospace.x-guru' 'Gurmukhi MT'
		'font.name-list.serif.x-guru' 'Gurmukhi MT'
		'font.name-list.sans-serif.x-guru' 'Gurmukhi MT'
		'font.name-list.monospace.x-guru' 'Gurmukhi MT'

		'font.name.serif.x-khmr' 'Khmer MN'
		'font.name.sans-serif.x-khmr' 'Khmer Sangam MN'
		'font.name.monospace.x-khmr' 'Khmer Sangam MN'
		'font.name-list.serif.x-khmr' 'Khmer MN'
		'font.name-list.sans-serif.x-khmr' 'Khmer Sangam MN'
		'font.name-list.monospace.x-khmr' 'Khmer Sangam MN'

		'font.name.serif.x-mlym' 'Malayalam MN'
		'font.name.sans-serif.x-mlym' 'Malayalam Sangam MN'
		'font.name.monospace.x-mlym' 'Malayalam Sangam MN'
		'font.name-list.serif.x-mlym' 'Malayalam MN'
		'font.name-list.sans-serif.x-mlym' 'Malayalam Sangam MN'
		'font.name-list.monospace.x-mlym' 'Malayalam Sangam MN'

		'font.name.serif.x-orya' 'Oriya MN'
		'font.name.sans-serif.x-orya' 'Oriya Sangam MN'
		'font.name.monospace.x-orya' 'Oriya Sangam MN'
		'font.name-list.serif.x-orya' 'Oriya MN'
		'font.name-list.sans-serif.x-orya' 'Oriya Sangam MN'
		'font.name-list.monospace.x-orya' 'Oriya Sangam MN'

		"Pothana http://web.nickshanks.com/typography/telugu/"
		'font.name.serif.x-telu' 'Telugu MN'
		'font.name.sans-serif.x-telu' 'Telugu Sangam MN'
		'font.name.monospace.x-telu' 'Telugu Sangam MN'
		'font.name-list.serif.x-telu' 'Telugu MN,Pothana'
		'font.name-list.sans-serif.x-telu' 'Telugu Sangam MN,Pothana'
		'font.name-list.monospace.x-telu' 'Telugu Sangam MN,Pothana'

		"Kedage http://web.nickshanks.com/typography/kannada/"
		'font.name.serif.x-knda' 'Kannada MN'
		'font.name.sans-serif.x-knda' 'Kannada Sangam MN'
		'font.name.monospace.x-knda' 'Kannada Sangam MN'
		'font.name-list.serif.x-knda' 'Kannada MN,Kedage'
		'font.name-list.sans-serif.x-knda' 'Kannada Sangam MN,Kedage'
		'font.name-list.monospace.x-knda' 'Kannada Sangam MN,Kedage'

		'font.name.serif.x-sinh' 'Sinhala MN'
		'font.name.sans-serif.x-sinh' 'Sinhala Sangam MN'
		'font.name.monospace.x-sinh' 'Sinhala Sangam MN'
		'font.name-list.serif.x-sinh' 'Sinhala MN'
		'font.name-list.sans-serif.x-sinh' 'Sinhala Sangam MN'
		'font.name-list.monospace.x-sinh' 'Sinhala Sangam MN'

		'font.name.serif.x-tamil' 'InaiMathi'
		'font.name.sans-serif.x-tamil' 'InaiMathi'
		'font.name.monospace.x-tamil' 'InaiMathi'
		'font.name-list.serif.x-tamil' 'InaiMathi'
		'font.name-list.sans-serif.x-tamil' 'InaiMathi'
		'font.name-list.monospace.x-tamil' 'InaiMathi'

		"Kailasa ships with mac os x >= 10.5"
		'font.name.serif.x-tibt' 'Kailasa'
		'font.name.sans-serif.x-tibt' 'Kailasa'
		'font.name.monospace.x-tibt' 'Kailasa'
		'font.name-list.serif.x-tibt' 'Kailasa'
		'font.name-list.sans-serif.x-tibt' 'Kailasa'
		'font.name-list.monospace.x-tibt' 'Kailasa'

		'font.name.serif.x-unicode' 'Times'
		'font.name.sans-serif.x-unicode' 'Helvetica'
		'font.name.monospace.x-unicode' 'Courier'
		'font.name.cursive.x-unicode' 'Apple Chancery'
		'font.name.fantasy.x-unicode' 'Papyrus'
		'font.name-list.serif.x-unicode' 'Times'
		'font.name-list.sans-serif.x-unicode' 'Helvetica'
		'font.name-list.monospace.x-unicode' 'Courier'
		'font.name-list.cursive.x-unicode' 'Apple Chancery'
		'font.name-list.fantasy.x-unicode' 'Papyrus'

		'font.name.serif.x-western' 'Times'
		'font.name.sans-serif.x-western' 'Helvetica'
		'font.name.monospace.x-western' 'Courier'
		'font.name.cursive.x-western' 'Apple Chancery'
		'font.name.fantasy.x-western' 'Papyrus'
		'font.name-list.serif.x-western' 'Times,Times New Roman'
		'font.name-list.sans-serif.x-western' 'Helvetica,Arial'
		'font.name-list.monospace.x-western' 'Courier,Courier New'
		'font.name-list.cursive.x-western' 'Apple Chancery'
		'font.name-list.fantasy.x-western' 'Papyrus'

		'font.name.serif.zh-CN' 'Times'
		'font.name.sans-serif.zh-CN' 'Helvetica'
		'font.name.monospace.zh-CN' 'Courier'
		'font.name.cursive.zh-CN' 'Kaiti SC'
		'font.name-list.serif.zh-CN' 'Times,STSong,Heiti SC'
		'font.name-list.sans-serif.zh-CN' 'Helvetica,PingFang SC,STHeiti,Heiti SC'
		'font.name-list.monospace.zh-CN' 'Courier,PingFang SC,STHeiti,Heiti SC'

		'font.name.serif.zh-TW' 'Times'
		'font.name.sans-serif.zh-TW' 'Helvetica'
		'font.name.monospace.zh-TW' 'Courier'
		'font.name.cursive.zh-TW' 'Kaiti TC'
		'font.name-list.serif.zh-TW' 'Times,LiSong Pro,Heiti TC'
		'font.name-list.sans-serif.zh-TW' 'Helvetica,PingFang TC,Heiti TC,LiHei Pro'
		'font.name-list.monospace.zh-TW' 'Courier,PingFang TC,Heiti TC,LiHei Pro'

		'font.name.serif.zh-HK' 'Times'
		'font.name.sans-serif.zh-HK' 'Helvetica'
		'font.name.monospace.zh-HK' 'Courier'
		'font.name.cursive.zh-HK' 'Kaiti TC'
		'font.name-list.serif.zh-HK' 'Times,LiSong Pro,Heiti TC'
		'font.name-list.sans-serif.zh-HK' 'Helvetica,PingFang TC,Heiti TC,LiHei Pro'
		'font.name-list.monospace.zh-HK' 'Courier,PingFang TC,Heiti TC,LiHei Pro'

		"XP_MACOSX changes to default font sizes"
		'font.minimum-size.th' 10
		'font.size.variable.zh-CN' 15
		'font.size.variable.zh-HK' 15
		'font.size.variable.zh-TW' 15

		'font.name.serif.x-math' 'Latin Modern Math'
		"Apple''s Symbol is Unicode so use it"
		'font.name-list.serif.x-math' 'Latin Modern Math, XITS Math, Cambria Math, Libertinus Math, DejaVu Math TeX Gyre, TeX Gyre Bonum Math, TeX Gyre Pagella Math, TeX Gyre Schola, TeX Gyre Termes Math, STIX Math, Asana Math, STIXGeneral, DejaVu Serif, DejaVu Sans, Symbol, Times'
		'font.name.sans-serif.x-math' 'Helvetica'
		'font.name.monospace.x-math' 'Courier'
		'font.name.cursive.x-math' 'Apple Chancery'
		'font.name.fantasy.x-math' 'Papyrus'

		"Individual font faces to be treated as independent families,"
		"listed as <Postscript name of face:Owning family name>"
		'font.single-face-list' 'Osaka-Mono:Osaka'

		"optimization hint for fonts with localized names to be read in at startup, otherwise read in at lookup miss"
		"names are canonical family names (typically English names)"
		'font.preload-names-list' 'Hiragino Kaku Gothic ProN,Hiragino Mincho ProN,STSong'

		"Override font-weight values for some problematic families Apple ships"
		"(see bug 931426)."
		"The name here is the font''s PostScript name, which can be checked in"
		"the Font Book utility or other tools."
		'font.weight-override.AppleSDGothicNeo-Thin' 100  "Ensure Thin < UltraLight < Light"
		'font.weight-override.AppleSDGothicNeo-UltraLight' 200
		'font.weight-override.AppleSDGothicNeo-Light' 300
		'font.weight-override.AppleSDGothicNeo-Heavy' 900  "Ensure Heavy > ExtraBold (800)"

		'font.weight-override.Avenir-Book' 300  "Ensure Book < Roman (400)"
		'font.weight-override.Avenir-BookOblique' 300
		'font.weight-override.Avenir-MediumOblique' 500  "Harmonize MediumOblique with Medium"
		'font.weight-override.Avenir-Black' 900  "Ensure Black > Heavy (800)"
		'font.weight-override.Avenir-BlackOblique' 900

		'font.weight-override.AvenirNext-MediumItalic' 500  "Harmonize MediumItalic with Medium"
		'font.weight-override.AvenirNextCondensed-MediumItalic' 500

		'font.weight-override.HelveticaNeue-Light' 300  "Ensure Light > Thin (200)"
		'font.weight-override.HelveticaNeue-LightItalic' 300
		'font.weight-override.HelveticaNeue-MediumItalic' 500  "Harmonize MediumItalic with Medium"
	)
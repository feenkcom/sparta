configuration
defaultPreferences
	"general for all platforms!"
	^ #(
		'gfx.canvas.azure.accelerated' false "desable because of artifacts"

		'gfx.canvas.azure.backends' 'skia'
		'gfx.content.azure.backends' 'cairo'
		
		'gfx.font_loader.families_per_slice' 3
		'gfx.font_loader.delay' 8000
		'gfx.font_loader.interval' 50
		
		'gfx.downloadable_fonts.woff2.enabled' true
		
		'gfx.color_management.force_srgb' false
		'gfx.color_management.display_profile' ''
		"0 = Off, 1 = Full, 2 = Tagged Images Only."
		"See eCMSMode in gfx/thebes/gfxPlatform.h"
		'gfx.color_management.mode' 1
		'gfx.color_management.rendering_intent' 0
		'gfx.color_management.enablev4' false
		
		'bidi.numeral' 0
		
		'gfx.font_rendering.wordcache.charlimit' 32
		'gfx.font_rendering.opentype_svg.enabled' false
		'gfx.font_rendering.fallback.always_use_cmaps' false
		'gfx.font_rendering.wordcache.maxentries' 10000
		
		'font.blacklist.underline_offset' 'FangSong,Gulim,GulimChe,MingLiU,MingLiU-ExtB,MingLiU_HKSCS,MingLiU-HKSCS-ExtB,MS Gothic,MS Mincho,MS PGothic,MS PMincho,MS UI Gothic,PMingLiU,PMingLiU-ExtB,SimHei,SimSun,SimSun-ExtB,Hei,Kai,Apple LiGothic,Apple LiSung,Osaka'
		
		"Default font types and sizes by locale"
		'font.default.ar' 'sans-serif'
		'font.minimum-size.ar' 0
		'font.size.variable.ar' 16
		'font.size.fixed.ar' 13

		'font.default.el' 'serif'
		'font.minimum-size.el' 0
		'font.size.variable.el' 16
		'font.size.fixed.el' 13

		'font.default.he' 'sans-serif'
		'font.minimum-size.he' 0
		'font.size.variable.he' 16
		'font.size.fixed.he' 13

		'font.default.ja' 'sans-serif'
		'font.minimum-size.ja' 0
		'font.size.variable.ja' 16
		'font.size.fixed.ja' 16

		'font.default.ko' 'sans-serif'
		'font.minimum-size.ko' 0
		'font.size.variable.ko' 16
		'font.size.fixed.ko' 16

		'font.default.th' 'sans-serif'
		'font.minimum-size.th' 0
		'font.size.variable.th' 16
		'font.size.fixed.th' 13

		'font.default.x-cyrillic' 'serif'
		'font.minimum-size.x-cyrillic' 0
		'font.size.variable.x-cyrillic' 16
		'font.size.fixed.x-cyrillic' 13

		'font.default.x-devanagari' 'serif'
		'font.minimum-size.x-devanagari' 0
		'font.size.variable.x-devanagari' 16
		'font.size.fixed.x-devanagari' 13

		'font.default.x-tamil' 'serif'
		'font.minimum-size.x-tamil' 0
		'font.size.variable.x-tamil' 16
		'font.size.fixed.x-tamil' 13

		'font.default.x-armn' 'serif'
		'font.minimum-size.x-armn' 0
		'font.size.variable.x-armn' 16
		'font.size.fixed.x-armn' 13

		'font.default.x-beng' 'serif'
		'font.minimum-size.x-beng' 0
		'font.size.variable.x-beng' 16
		'font.size.fixed.x-beng' 13

		'font.default.x-cans' 'serif'
		'font.minimum-size.x-cans' 0
		'font.size.variable.x-cans' 16
		'font.size.fixed.x-cans' 13

		'font.default.x-ethi' 'serif'
		'font.minimum-size.x-ethi' 0
		'font.size.variable.x-ethi' 16
		'font.size.fixed.x-ethi' 13

		'font.default.x-geor' 'serif'
		'font.minimum-size.x-geor' 0
		'font.size.variable.x-geor' 16
		'font.size.fixed.x-geor' 13

		'font.default.x-gujr' 'serif'
		'font.minimum-size.x-gujr' 0
		'font.size.variable.x-gujr' 16
		'font.size.fixed.x-gujr' 13

		'font.default.x-guru' 'serif'
		'font.minimum-size.x-guru' 0
		'font.size.variable.x-guru' 16
		'font.size.fixed.x-guru' 13

		'font.default.x-khmr' 'serif'
		'font.minimum-size.x-khmr' 0
		'font.size.variable.x-khmr' 16
		'font.size.fixed.x-khmr' 13

		'font.default.x-mlym' 'serif'
		'font.minimum-size.x-mlym' 0
		'font.size.variable.x-mlym' 16
		'font.size.fixed.x-mlym' 13

		'font.default.x-orya' 'serif'
		'font.minimum-size.x-orya' 0
		'font.size.variable.x-orya' 16
		'font.size.fixed.x-orya' 13

		'font.default.x-telu' 'serif'
		'font.minimum-size.x-telu' 0
		'font.size.variable.x-telu' 16
		'font.size.fixed.x-telu' 13

		'font.default.x-knda' 'serif'
		'font.minimum-size.x-knda' 0
		'font.size.variable.x-knda' 16
		'font.size.fixed.x-knda' 13

		'font.default.x-sinh' 'serif'
		'font.minimum-size.x-sinh' 0
		'font.size.variable.x-sinh' 16
		'font.size.fixed.x-sinh' 13

		'font.default.x-tibt' 'serif'
		'font.minimum-size.x-tibt' 0
		'font.size.variable.x-tibt' 16
		'font.size.fixed.x-tibt' 13

		'font.default.x-unicode' 'serif'
		'font.minimum-size.x-unicode' 0
		'font.size.variable.x-unicode' 16
		'font.size.fixed.x-unicode' 13

		'font.default.x-western' 'serif'
		'font.minimum-size.x-western' 0
		'font.size.variable.x-western' 16
		'font.size.fixed.x-western' 13

		'font.default.zh-CN' 'sans-serif'
		'font.minimum-size.zh-CN' 0
		'font.size.variable.zh-CN' 16
		'font.size.fixed.zh-CN' 16

		'font.default.zh-HK' 'sans-serif'
		'font.minimum-size.zh-HK' 0
		'font.size.variable.zh-HK' 16
		'font.size.fixed.zh-HK' 16

		'font.default.zh-TW' 'sans-serif'
		'font.minimum-size.zh-TW' 0
		'font.size.variable.zh-TW' 16
		'font.size.fixed.zh-TW' 16

		"mathml.css sets font-size to 'inherit' and font-family to 'serif' so only"
		"font.name.*.x-math and font.minimum-size.x-math are really relevant."
		'font.default.x-math' 'serif'
		'font.minimum-size.x-math' 0
		'font.size.variable.x-math' 16
		'font.size.fixed.x-math' 13
	)
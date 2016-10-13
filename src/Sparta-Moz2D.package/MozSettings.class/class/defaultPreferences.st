configuration
defaultPreferences
	"general for all platforms!"
	^ #(
		'gfx.canvas.azure.backends' 'skia'
		'gfx.content.azure.backends' 'cairo'
		
		'gfx.font_loader.families_per_slice' 3
		'gfx.font_loader.delay' 8000
		'gfx.font_loader.interval' 50
		
		'gfx.color_management.force_srgb' false
		'gfx.color_management.display_profile' ''
		
		'bidi.numeral' 0
		
		'gfx.font_rendering.wordcache.charlimit' 32
		'gfx.font_rendering.opentype_svg.enabled' true
		'gfx.font_rendering.fallback.always_use_cmaps' false
		'gfx.font_rendering.wordcache.maxentries' 10000
		
		'font.blacklist.underline_offset' 'FangSong,Gulim,GulimChe,MingLiU,MingLiU-ExtB,MingLiU_HKSCS,MingLiU-HKSCS-ExtB,MS Gothic,MS Mincho,MS PGothic,MS PMincho,MS UI Gothic,PMingLiU,PMingLiU-ExtB,SimHei,SimSun,SimSun-ExtB,Hei,Kai,Apple LiGothic,Apple LiSung,Osaka'
	)
return {
	default = function(colors)
		return {
			bg = colors.white_1,
			bg_dim = colors.white_2,
			bg_dark = colors.black,
			bg_light0 = colors.white_3,
			bg_light1 = colors.white_3,
			bg_light2 = colors.light_gray_4,
			bg_light3 = colors.light_gray_3,

			bg_menu = colors.gray_4,
			bg_menu_sel = colors.gray_3,

			bg_status = colors.blue4,
			bg_visual = colors.blue_2,
			bg_search = colors.blue,

			fg_border = colors.light_gray_3,
			fg_dark = colors.black,
			fg_reverse = colors.gray_2,

			fg_comment = colors.green_2,
			fg = colors.black,
			fg_menu = colors.white_2,

			co = colors.orange_2,
			st = colors.blue_2,
			nu = colors.pink,
			id = colors.black,
			fn = colors.blue_4,
			sm = colors.purple_1,
			kw = colors.purple_1,
			op = colors.gray_2,
			pp = colors.orange_2,
			ty = colors.blue_5,
			sp = colors.blue,
			sp2 = colors.light_red,
			sp3 = colors.light_red_2,
			br = colors.purple_2,
			re = colors.orange,
			dep = colors.gray_2,

			diag = {
				error = colors.light_red,
				warning = colors.yellow,
				info = colors.blue_2,
				hint = colors.purple_2,
			},

			diff = {
				add = colors.light_gray_2,
				delete = colors.light_gray_3,
				change = colors.light_beige,
				text = colors.beige,
			},

			git = {
				added = colors.green_2,
				removed = colors.light_red,
				changed = colors.orange_2,
			},
		}
	end,
}

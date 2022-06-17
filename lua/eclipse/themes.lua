return {
	default = function(colors)
		return {
			bg = "#ffffff",
			fg = "#000000",
			bg_dim = "Gray",
			fg_dark = "#f8f8f8",
			bg_dark = "#707070",
			bg_light = "#e7e7ff",

			incSearch = {
				fg = "#404040",
				bg = "#e0e040",
			},

			search = {
				fg = "#544060",
				bg = "#f0c0ff",
			},

			diag = {
				error = { fg = "#f8f8f8", bg = "#4040ff" },
				warning = { fg = "#f8f8f8", bg = "#4040ff" },
				info = { fg = "#f8f8f8", bg = "#4040ff" },
				hint = { fg = "#f8f8f8", bg = "#4040ff" },
			},
			modeMsg = { fg = "#d06000" },
			moreMsg = { fg = "#0090a0" },
			question = { fg = "#8000ff" },

			diff = {
				text = { fg = "Red", bg = "#ffd0d0" },
				change = { fg = "Black", bg = "#ffe7e7" },
				delete = { fg = "Red", bg = "#e7e7ff" },
				add = { fg = "Blue", bg = "#e7e7ff" },
			},

			git = {
				added = { fg = "Blue", bg = "#e7e7ff" },
				removed = { fg = "Red", bg = "#e7e7ff" },
				changed = { fg = "Black", bg = "#ffe7e7" },
			},
			statusLine = { fg = "#ffffff", bg = "#4570aa" },
			statusLineNC = { fg = "#ffffff", bg = "#75a0da" },
			vertSplit = { fg = "#f8f8f8", bg = "#904838" },
			wildMenu = { fg = "#f8f8f8", bg = "#ff3030" },

			cursorLine = { fg = "Black", bg = "#75a0da" },

			cursor = { fg = "#ffffff", bg = "#0080f0" },
			lCursor = { fg = "#ffffff", bg = "#8040ff" },
			cursorIM = { fg = "#ffffff", bg = "#8040ff" },

			folded = { fg = "#804030", bg = "#fff0d0" },
			foldColumn = { fg = "#6b6b6b", bg = "#e7e7e7" },

			pMenu = { bg = "Green", fg = "White" },
			pMenuSel = { bg = "White", fg = "Black" },
			pMenuSBar = { bg = "Red", fg = "White" },
			pMenuThumb = { bg = "White", fg = "Red" },

			directory = { fg = "#7050ff" },
			lineNr = { fg = "#6b6b6b", bg = "#eeeeee" },
			nonText = { fg = "#707070", bg = "#e7e7e7" },
			specialKey = { fg = "#c0c0c0" },
			title = { fg = "#0033cc" },
			visual = { fg = "#804020", bg = "#ffc0a0" },

			comment = { fg = "#236e25" },
			constant = { fg = "#00884c" },
			error = { fg = "#f8f8f8", bg = "#4040ff" },
			preProc = { fg = "#683821" },
			special = { fg = "#8040f0" },
			statement = { fg = "#b64f90" },
			todo = { fg = "#ff5050", bg = "White" },
			type = { fg = "#7f0055" },
			underlined = { fg = "Blue" },
			string = { fg = "#8010a0" },
			number = { fg = "#0000ff" },
			identifier = { fg = "Gray" },
			operator = { fg = "Gray" },
			keyword = { fg = "Black" },
			specialException = { fg = "Pink" },
			specialReturn = { fg = "Pink" },
			regex = { fg = "#804020" },
			specialVar = { fg = "DarkMagenta" },
			func = { fg = "Black" },
		}
	end,
}

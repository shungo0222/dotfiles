-- 🏠 Startup screen using alpha-nvim

return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- Optional: icons for header/art
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.startify")

		-- 🎨 Custom ASCII art header (dashboard.section.header.val)
		dashboard.section.header.val = {
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
		}

		-- 🚀 Apply the dashboard theme setup
		alpha.setup(dashboard.opts)
	end,
}

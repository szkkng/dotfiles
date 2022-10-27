local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
  return
end

mason.setup()
mason_lspconfig.setup()

local nvim_lsp = require("lspconfig")

mason_lspconfig.setup_handlers({ function(server_name)
	local opts = {
		on_attach = require("kengo.lsp.handlers").on_attach,
		capabilities = require("kengo.lsp.handlers").capabilities,
	}
  nvim_lsp[server_name].setup(opts)
end })

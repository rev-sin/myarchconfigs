local config = require("plugins.configs.lspconfig")

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

lspconfig.jedi_language_server.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"}
}

lspconfig.svls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"verilog", "systemverilog"}
}


lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities
}

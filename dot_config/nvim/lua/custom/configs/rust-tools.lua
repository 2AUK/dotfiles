local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local extension_path ='/home/abdullah/.vscode-oss/extensions/vadimcn.vscode-lldb-1.10.0-universal/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb'
local this_os = vim.loop.os_uname().sysname;
liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")

local options = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
  tools = {
    inlay_hints = {
      auto = true,
    },
  },
 dap = {
    adapter = {
      type = "executable",
      command = "lldb-vscode-14",
      name = "rt_lldb",
    },
  },
}

return options

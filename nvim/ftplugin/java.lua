-- require("lspconfig").jdtls.setup({ root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw" }, { upward = true })[1]),
--   -- cmd({
--   --   "/home/americo/Documents/Java-lib/jdt-language-server-1.9.0-202203031534/bin/jdtls",
--   -- }),
-- })
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
--
--
-- local config = {
--   -- the command that start the language server
--   cmd = {
--     "java",
--     "-Declipse.application=org.eclipse.jdt.ls.core.id1",
--     "-Dosgi.bundles.defaultStartLevel=4",
--     "-Declipse.product=org.eclipse.jdt.ls.core.product",
--     "-Dlog.level=ALL",
--     "-noverify",
--     "-Xmx1G",
--     "-jar",
--     "/home/americo/Documents/Java-lib/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
--     "-configuration", "/home/americo/Documents/Java-lib/jdt-language-server-1.9.0-202203031534/config_linux/",
--     "-data",
--     vim.fn.expand("~/.cache/jdtls-workspace") .. workspace_dir,
--   },
--   -- this is the default if not provided you can remove it. Or adjust as needed
--   -- One dedicated LSP server and client will be started per unique root_dir
--   capabilities = capabilities,
--   settings = {
--     java = {},
--   },
--
--   init_options = {
--     bundles = {},
--   },
-- }
-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`

local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), "p:h:t")
local config = {
  cmd = {
    --
    "java", -- Or the absolute path '/path/to/java11_or_newer/bin/java'
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    --
    "-jar",
    "/home/americo/Documents/Java-lib/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
    "-configuration",
    "/home/americo/Documents/Java-lib/jdt-language-server-1.9.0-202203031534/config_linux",
    "-data",
    vim.fn.expand("~/.cache/jdtls-workspace") .. workspace_dir,
  },
  settings = {
    java = {
      signatureHelp = { enabled = true },
      import = { enabled = true },
      rename = { enabled = true },
    },
  },
  init_options = {
    bundles = {},
  },
  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
}
require("lspconfig").jdtls.setup(config)
require("jdtls").start_or_attach(config)
-- -- Mappings.
-- -- See `:help vim.lsp.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

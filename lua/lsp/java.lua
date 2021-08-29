local nvim_lsp = require('lspconfig')

local Java = {}

local function java(on_attach)
  vim.cmd([[
    au FileType java lua require('lsp.java').on_java_file(require('lsp.lsp').on_attach)
  ]])
end

local function telescope_jdtls()
  local finders = require'telescope.finders'
  local sorters = require'telescope.sorters'
  local actions = require'telescope.actions'
  local pickers = require'telescope.pickers'
  require('jdtls.ui').pick_one_async = function(items, prompt, label_fn, cb)
    local opts = {}
    pickers.new(opts, {
      prompt_title = prompt,
      finder    = finders.new_table {
        results = items,
        entry_maker = function(entry)
          return {
            value = entry,
            display = label_fn(entry),
            ordinal = label_fn(entry),
          }
        end,
      },
      sorter = sorters.get_generic_fuzzy_sorter(),
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          local selection = actions.get_selected_entry()
          actions.close(prompt_bufnr)

          cb(selection.value)
        end)

        return true
      end,
    }):find()
  end
end

local map = function(type, key, value)
	vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

Java.on_attach = function()
  --require('jdtls').setup_dap()
  require('jdtls').setup_dap({ hotcodereplace = 'auto' })
  require'jdtls.setup'.add_commands()
end


function Java.on_java_file(first_on_attach)
  require('jdtls').start_or_attach({
    cmd = {'launch-jdtls'},
    on_attach = function (client)
      first_on_attach(client)
      Jvm.on_attach()
    end,
    root_dir = require('jdtls.setup').find_root({'build.gradle', 'pom.xml', '.git', '*.iml'}),
    init_options = {
      bundles = {
        vim.fn.glob("/home/milse113/Scripts/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")
      }
    }
  })
  --telescope_jdtls()
end

function Java.init(on_attach)
  java()
end

return Java

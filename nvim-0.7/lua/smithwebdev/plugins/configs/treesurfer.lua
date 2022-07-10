local M = {}

M.plugin = {
  'ziontee113/syntax-tree-surfer', -- https://github.com/ziontee113/syntax-tree-surfer

  config = function()
    require('syntax-tree-surfer').setup({
      highlight_group = 'STS_highlight',
      disable_no_instance_found_report = false,
      default_desired_types = {
        'function',
        'function_definition',
        'if_statement',
        'else_clause',
        'else_statement',
        'elseif_statement',
        'for_statement',
        'while_statement',
        'switch_statement'
      },
      icon_dictionary = {
        ['if_statement'] = '',
        ['else_clause'] = '',
        ['else_statement'] = '',
        ['elseif_statement'] = '',
        ['for_statement'] = 'ﭜ',
        ['while_statement'] = 'ﯩ',
        ['switch_statement'] = 'ﳟ',
        ['function'] = '',
        ['function_definition'] = '',
        ['variable_declaration'] = '',
      }
    })
  end
}

return M

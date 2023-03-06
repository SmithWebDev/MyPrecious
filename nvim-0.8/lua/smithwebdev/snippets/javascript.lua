return {
  -- Console Log
  s({ trig = 'log', name = 'Console Log command', dscr = 'Console Log' },
    fmt([[console.log({})]], {
      i(1, 'message to log')
    })
  ),

  -- Import Keyword
  s({ trig = 'imp', name = 'import + from module', dscr = 'import keyword' },
    fmt([[import {};]], {
      c(1, {
        i(1),
        { i(1, ''), t(" from '"), i(2, 'location'), t("'") },
        { t("{"), i(1, ''), t("} from '"), i(2, 'location'), t("'") },
      })
    })
  ),

  -- Custom Turbo Stream Action Body
  s({
    trig = 'SA',
    name = 'Stream Actions Function',
    dscr = 'Custom Turbo Stream Action Body'
  },
    fmt([[
      import {{StreamActions}} from '@hotwired/turbo'

      StreamActions.{} = function() {{
        let {} = this.{}

        this.{}Elements.{}
      }}
    ]], {
      i(1),
      i(2),
      i(3),
      i(4),
      i(5),
    })
  ),

  -- Stimulus - Set Value params
  s({
    trig = 'st',
    name = 'Static Target',
    dscr = 'Stimulus - Set Target params'
  },
    fmt([[static target{}={}]], {
      c(1, {
        t(''),
        t('s'),
      }),
      c(2, {
        i(1),
        { t('[ "'), i(1), t('" ]') },
      })
    })
  ),

  -- Stimulus - Access Value params
  s({
    trig = 'tt',
    name = 'This Target',
    dscr = 'Stimulus - Access Target params'
  },
    fmt([[this.{}Target]], {
      i(1),
    })
  ),

  -- Stimulus - Set Value params
  s({
    trig = 'sv',
    name = 'Set Value',
    dscr = 'Stimulus - Set Value params'
  },
    fmt("static value{} = {}", {
      c(1, {
        t(''),
        t('s')
      }),
      i(2),
    })
  ),

  -- Stimulus - Access Value params
  s({
    trig = 'tv',
    name = 'This Value',
    dscr = 'Stimulus - Access Value params'
  },
    fmt([[this.{}Value]], {
      i(1),
    })
  ),

  -- Rails JS App Register
  s({
    trig = 'appreg',
    name = 'Application Registration',
    dscr = 'Rails JS App Register'
  },
    fmt([[application.register('{}', {}Controller)]], {
      i(1, 'controller name'),
      i(2, 'controller')
    })
  ),
}

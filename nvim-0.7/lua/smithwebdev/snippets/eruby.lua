return {

  -- Link_to Helper snippet
  s({
    trig = 'ltc',
    name = 'Link to with class',
    dscr = 'Link_to tag with added class option / optional delete action'
  }, fmt(
      [[<%= link_to '{}', {}_path{},{} class: '{}' %>]],
      { i(1), i(2), i(3), c(4, { t(''), t(' method: :delete,') }), i(5) })),

  -- Button_to Helper snippet
  s({
    trig = 'btc',
    name = 'Button to with class',
    dscr = 'Button_to tag with added class option / optional delete action'
  }, fmt(
      [[<%= button_to '{}', {}_path{},{} class: '{}' %>]],
      { i(1), i(2), i(3), c(4, { t(''), t(' method: :delete,') }), i(5) })),

  -- Turbo Frame Tag helper block *WIP*
  s({
    trig = 'tftb',
    name = 'turbo_frame_tag',
    dscr = 'Create turbo frame tag',
  },
    {
      t('<%= turbo_frame_tag '),
      i(1),
      t(' do %>'),
      f(function(_, snip)
        return snip.env.TM_SELECTED_TEXT[1] or {}
      end, {}),
      t('<% end %>'),
      i(0)
    }
  ),

  -- Turbo Frame Tag helper snippet
  s({
    trig = 'tft',
    name = 'turbo_frame_tag',
    dscr = 'Create turbo frame tag',
  }, {
      t('<%= turbo_frame_tag '),
      c(1, { t(''), { t('dom_id('), i(1), t(')') } }),
      t(' do %>'),
      i(0)
    }),

  -- Data Turbo Frame attribute snippet
  s({
    trig = 'dtframe',
    name = 'data turbo frame',
    dscr = 'Data attr for turbo frames'
  }, fmt([[{}data: {{ turbo_frame: {} }}{}]], {
      c(1, { t(''), t(', ') }),
      c(2, { t('\'_top\''), i(1), { t('dom_id('), i(1), t(') ') } }),
      c(3, { t(''), t(', ') })
    })
  ),

  -- Turbo Stream helper tag snippet
  s({
    trig = 'tstream',
    name = 'turbo stream',
    dscr = 'Inserts turbo stream tag with methods, partial, locals support'
  }, fmt([[<%= turbo_stream{}{} {}{}{} %>]],
      { c(1, {
        t('.'),
         t('_from'),
        t('_from.'),
        t('')
      }),
        c(2, {
          t(''),

          -- Remove a Turbo Frame
          t('remove'),
          t('remove_all'),

          -- Insert a Turbo Frame at the beginning/end of a list
          t('append'),
          t('append_all'),
          t('prepend'),
          t('prepend_all'),

          -- Insert a Turbo Frame before/after another Turbo Frame
          t('before'),
          t('before_all'),
          t('after'),
          t('after_all'),

          -- Replace or update the content of a Turbo Frame
          t('replace'),
          t('replace_all'),
          t('update'),
          t('update_all'),

          t('action'),
          t('action_all'),
        }),
        i(3),
        c(4, {
          t(''),
          { t(', partial: \''),
            i(1),
            t('\' ') },
        }),
        c(5, {
          t(''),
          { t(', locals: { '),
            i(1), t(': @'), rep(1),
            t(' }')
          }
        })
      })
  ),
  s({
    trig = 'aftcommit',
    name = 'After Commit Actions',
    dscr = 'Broadcast transaction shortcuts'
  }, fmt(
      [[after_{}_commit -> {{ {}
                            partial: '{}',
                            locals: {{ {}: {} }},
                            target: '{}' }}]],
      {c(1,{
        t('save'),
        t('create'),
        t('update'),
        t('destroy')
      }),
        i(2, 'bactions'),
        i(3),
        i(4),
        i(5),
        i(6),
      })
  ),
  s({
    trig = 'bactions',
    name = 'Broadcast ActionHelpers',
    dscr = 'Turbo Streams Broadcast ActionHelpers'
  }, fmt([[
  broadcast_{}_to '{}'{}
  ]], {
        c(1,{
          t('remove'),
          t('replace'),
          t('update'),
          t('before'),
          t('after'),
          t('append'),
          t('prepend'),
          t('action'),
          t('replace_later'),
          t('update_later'),
          t('before_later'),
          t('after_later'),
          t('append_later'),
          t('prepend_later'),
          t('action_later'),
          t('render'),
          t('render_later'),
        }),
        i(2),
        c(3,{
          t(''),
          t(', ')
        })
      })
  ),
},
  print("eruby snippets attached")

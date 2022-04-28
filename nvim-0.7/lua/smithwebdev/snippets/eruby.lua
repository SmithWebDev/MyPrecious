return {
  s({
    trig = 'ltc',
    name = 'Link to with class',
    dscr = 'Link_to tag with added class option / optional delete action'
  }, fmt(
    [[<%= link_to '{}', {}_path{},{} class: '{}' %>]],
    { i(1), i(2), i(3), c(4, { t(''), t(' method: :delete,') }), i(5) })),
  s({
    trig = 'btc',
    name = 'Button to with class',
    dscr = 'Button_to tag with added class option / optional delete action'
  }, fmt(
    [[<%= button_to '{}', {}_path{},{} class: '{}' %>]],
    { i(1), i(2), i(3), c(4, { t(''), t(' method: :delete,') }), i(5) })),
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
  s({
    trig = 'dtframe',
    name = 'data turbo frame',
    dscr = 'Data attr for turbo frames'
  },
    fmt([[{}data: {{ turbo_frame: {} }}{}]], {
      c(1, { t(''), t(', ') }),
      c(2, { t('\'_top\''), i(1), { t('dom_id('), i(1), t(') ') } }),
      c(3, { t(''), t(', ') })
    })
  ),
  s({
    trig = 'tstream',
    name = 'turbo stream',
    dscr = 'Inserts turbo stream tag with methods, partial, locals support'
  },
    fmt([[<%= turbo_stream{}{} {}{}{} %>]],
      { c(1, {
      t('.'),
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
},
    print("eruby snippets attached")

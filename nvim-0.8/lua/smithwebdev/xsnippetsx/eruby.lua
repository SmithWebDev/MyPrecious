return {
require 'lua.smithwebdev.snippets.turbo_snippets',

  -- Link_to Helper snippet
  s(
    {
      trig = 'ltc',
      name = 'Link To',
      dscr = "Rails 'link to' helper"
    },
    fmt([[<%= link_to {}, {}{}{}%>]], {
      c(1,{
        {t("'"), i(1), t("'")},
        {i(1)},
      }),
      c(2,{
        {i(1)},
        {i(1),t('_path')},
        {i(1),t('_path('), i(2), t(')')},
        {t('new_'), i(1),t('_path')},
        {t('edit_'), i(1),t('_path('), i(2), t(')')},
        {t("'"), i(1), t("'")},
      }),
      c(3,{
        {i(1)},
        {t(", class: '"), i(1), t("' ")},
        {t(", class: '<%= "), i(1), t("%>' ")},
      }),
      c(4,{
        {i(1)},
        {t(', data: { turbo_frame: '), i(1), t(')}')},
        {t(', data: { turbo_frame: dom_id('), i(1), t(')}')},
        {t(', data: { turbo_method: dom_id('), i(1), t(')}')},
        {t(', data: { turbo_method: :delete')},
        {t(", data: { turbo_method: :delete, turbo_confirm: '"), i(1), t("'}")},
        {t('method: :delete')}
      }),
    })
  ),
  s(
    {
      trig = 'btc',
      name = 'Button To',
      dscr = "Rails 'button to' helper"
    },
    fmt([[<%= button_to {}, {}{}{}%>]], {
      c(1,{
        {t("'"), i(1), t("'")},
        {i(1)},
      }),
      c(2,{
        {i(1)},
        {i(1),t('_path')},
        {i(1),t('_path('), i(2), t(')')},
        {t('new_'), i(1),t('_path')},
        {t('edit_'), i(1),t('_path('), i(2), t(')')},
        {t("'"), i(1), t("'")},
      }),
      c(3,{
        {i(1)},
        {t(", class: '"), i(1), t("' ")},
        {t(", class: '<%= "), i(1), t("%>' ")},
      }),
      c(4,{
        {i(1)},
        {t(', data: { turbo_frame: '), i(1), t(')}')},
        {t(', data: { turbo_frame: dom_id('), i(1), t(')}')},
        {t(', data: { turbo_method: dom_id('), i(1), t(')}')},
        {t(', data: { turbo_method: :delete')},
        {t(", data: { turbo_method: :delete, turbo_confirm: '"), i(1), t("'}")},
        {t('method: :delete')}
      }),
    })
  ),

  -- Button_to Helper snippet
  --s({
  --  trig = 'btc',
  --  name = 'Button to with class',
  --  dscr = 'Button_to tag with added class option / optional delete action'
  --}, fmt(
  --    [[<%= button_to '{}'{}{}{}%>]], {
  --      i(1),
  --      c(2, {
  --        { t(', '), i(1), t('_path'), t(' ') },
  --        { t(', '), i(1), t('_path('), i(2), t(')') },
  --      }),
  --      c(3, {
  --        { t(', destroy_user_session_path, method: :delete'), t(' ') },
  --        { t(', '), i(1), t('_path('), i(2), t('), method: :delete'), t(' ') },
  --        { t(', '), i(1), t(', method: :delete'), t(' ') },
  --        { t(', destroy_user_session_path, data: {"turbo-method": :delete}'), t(' ') },
  --        { t(', '), i(1), t('_path('), i(2), t('), data: {"turbo-method": :delete}'), t(' ') },
  --        { t(', '), i(1), t(', data: {"turbo-method": :delete}'), t(' ') },
  --      }),
  --      c(4, {
  --        t(' '),
  --        { t(', class: \''), i(1), t('\'') }
  --      }),

  --    })),

  s({
    trig = 'imgt',
    name = 'Image Tag',
    dscr = 'image tag rails helper'
  },
    fmt([[<%= image_tag({}) %>]], {
      c(1,{
        {i(1)},
        {i(1),t(", class: '"), i(2), t("'")},
      })
    })
  ),
  -- Turbo Snippets
  -- Turbo Frame
  s({
    trig = 'tf',
    name = 'turbo frame',
    dscr = 'Eruby Turbo Frame Tag'
  },
    fmt([[
    <turbo-frame{}>
    {}
    </turbo-frame>
    ]], {
        c(1,{
          {t(" id='"), i(1), t("'")},
          {t(" id='"), i(1), t("' "), t("src='"), i(2), t("'")},
          {t(" id='"), i(1), t("' "), t("src='"), i(2), t("'"),t(" loading='lazy'")},
        }),
        i(2)
      })
  ),
  ---- Turbo Frame Tag helper snippet
  s(
    {
      trig = 'tft',
      name = 'turbo frame tag',
      dscr = 'Turbo Frame Tag helper',
    },
    fmt(
      [[
      <%= turbo_frame_tag{} %>
        {}
      <% end %>
      ]],
      {
        c(1,{
          i(1),
          {t('(dom_id '), i(1), t(') do')}
        }),
        i(2)
      })
  ),
  s({
    trig = 'ts',
    name = 'turbo stream Tag',
    dscr = 'turbo stream tag for custom helper'
  },
    fmt([[
    <%= turbo_stream.{}({}) %>
    ]], {
        i(1, 'custom helper method'),
        i(2, 'input message/function')
      })
  ),

  s({
    trig = 'tsa',
    name = 'Turbo Stream w/ Action',
    dscr = 'turbo stream tag with action'
  },
    fmt([[
    <turbo-stream action='{}' {}>
      {}
    </turbo-stream>
    ]], {
        c(1,{
          i(1, 'custom action'),
          t('append'),
          t('prepend'),
          t('before'),
          t('after'),
          t('replace'),
          t('update'),
          t('remove')
        }),
        c(2,{
          {t("target='"), i(1, 'dom_id'), t("' ")},
          {t("targets='"), i(1, 'css_class'), t("' ")},
          {t("message='"), i(1, 'custom message'), t("' ")},
          {t("text='"), i(1, 'custom text'), t("' ")},
          {t("target='"), i(1, 'dom_id'), t("' "), t("message='"), i(1, 'custom message'), t("' ")},
          {t("targets='"), i(1, 'css_class'), t("' "), t("message='"), i(1, 'custom message'), t("' ")},
          {t("target='"), i(1, 'dom_id'), t("' "), t("text='"), i(1, 'custom text'), t("' ")},
          {t("targets='"), i(1, 'css_class'), t("' "), t("text='"), i(1, 'custom text'), t("' ")},
        }),
        i(0)
      })
  ),
  s({
    trig = 'tsf',
    name = 'Turbo Stream From',
    dscr = 'Turbo Stream From tag for erb'
  },
    fmt(
      [[<%= turbo_stream_from '{}' %>]],
      {
        i(1)
      })
  ),











  -- Turbo Frame Tag helper block *WIP*
  --s({
  --  trig = 'tftb',
  --  name = 'turbo_frame_tag',
  --  dscr = 'Create turbo frame tag',
  --}, fmt([[
  --  <%= turbo_frame_tag {} do %>
  --    {}
  --  <% end %>
  --  ]], {
  --  c(1, { { i(1) }, t('\'_top\''), { t('dom_id('), i(1), t(') ') } }),
  --  f(function(_, snip)
  --    return snip.env.TM_SELECTED_TEXT[1] or {}
  --  end, {})
  --}
  --)
  --),

  --s({
  --  trig = 'tft',
  --  name = 'turbo_frame_tag',
  --  dscr = 'Create turbo frame tag',
  --}, fmt(
  --  [[<%= turbo_frame_tag {}{}]],
  --  {
  --  c(1, {
  --    i(1),
  --    {
  --      t('dom_id('),
  --      c(1, {
  --        i(1),
  --        { t('dom_id('), i(1), t(')') }
  --      }),
  --      t(')')
  --    },
  --  }),
  --  c(2, {
  --    t(' %>'),
  --    t(' do %>')
  --  })
  --})
  --),

  ---- Data Turbo Frame attribute snippet
  --s({
  --  trig = 'dtf',
  --  name = 'data turbo frame',
  --  dscr = 'Data attr for turbo frames'
  --}, fmt([[
  --{}
  --data: {{ turbo_frame: {} }}{}
  --]], {
  --  c(1, { t(''), t(', ') }),
  --  c(2, { t('\'_top\''), i(1), { t('dom_id('), i(1), t(') ') } }),
  --  c(3, { t(''), t(', ') })
  --})
  --),

  --s({
  --  trig = 'fdtf',
  --  name = 'data turbo frame',
  --  dscr = 'Data attr for turbo frames'
  --}, fmt([[{} form: {{data: {{ turbo_frame: {} }}{} }}]], {
  --  c(1, { t(''), t(', ') }),
  --  c(2, { t('\'_top\''), i(1), { t('dom_id('), i(1), t(') ') } }),
  --  c(3, { t(''), t(', ') })
  --})
  --),

  ---- Turbo Stream helper tag snippet
  --s({
  --  trig = 'tstream',
  --  name = 'turbo stream',
  --  dscr = 'Inserts turbo stream tag with methods, partial, locals support'
  --}, fmt([[<%= turbo_stream{}{} {}{}{} %>]],
  --  { c(1, {
  --  t('.'),
  --  t('_from'),
  --  t('_from.'),
  --  t('')
  --}),
  --c(2, {
  --  t(''),

  --  t('action'),
  --  t('action_all'),

  --  -- Insert a Turbo Frame before/after another Turbo Frame
  --  t('after'),
  --  t('after_all'),
  --  t('before'),
  --  t('before_all'),

  --  -- Insert a Turbo Frame at the beginning/end of a list
  --  t('append'),
  --  t('append_all'),
  --  t('prepend'),
  --  t('prepend_all'),

  --  -- Replace or update the content of a Turbo Frame
  --  t('replace'),
  --  t('replace_all'),
  --  t('update'),
  --  t('update_all'),

  --  -- Remove a Turbo Frame
  --  t('remove'),
  --  t('remove_all'),
  --}),
  --i(3),
  --c(4, {
  --  t(''),
  --  { t(', partial: \''),
  --    i(1),
  --    t('\' ') },
  --}),
  --c(5, {
  --  t(''),
  --  { t(', locals: { '),
  --    i(1), t(': @'), rep(1),
  --    t(' }')
  --  },
  --  t(' do')
  --})
  --})
  --),
  --s({
  --  trig = 'aftcommit',
  --  name = 'After Commit Actions',
  --  dscr = 'Broadcast transaction shortcuts'
  --}, fmt(
  --  [[after_{}_commit -> {{ {} {} {} {} }}]],
  --  { c(1, {
  --  t('save'),
  --  t('create'),
  --  t('update'),
  --  t('destroy')
  --}),
  --sn(2, {
  --  t('bactions')
  --}),
  --c(3, {
  --  { t('partial: \''),
  --    i(1),
  --    t('\',')
  --  },
  --  t('')
  --}),
  --c(4, {
  --  { t('locals: {'), i(1), t('}: {'), i(2), t('},') },
  --  t('')
  --}),
  --c(5, {
  --  { t('target: \''), i(1), t('\',') },
  --  t('')
  --}),
  --})
  --),
  --s({
  --  trig = 'bactions',
  --  name = 'Broadcast ActionHelpers',
  --  dscr = 'Turbo Streams Broadcast ActionHelpers'
  --}, fmt([[
  --broadcast{} '{}'{}
  --]], {
  --  c(1, {
  --    t('s_to'),
  --    t('_action_to'),
  --    t('_action_later_to'),
  --    t('_after_to'),
  --    t('_append_to'),
  --    t('_append_later_to'),
  --    t('_before_to'),
  --    t('_before_later_to'),
  --    t('_prepend_to'),
  --    t('_prepend_later_to'),
  --    t('_update_to'),
  --    t('_update_later_to'),
  --    t('_remove_to'),
  --    t('_render_to'),
  --    t('_render_later_to'),
  --    t('_replace_to'),
  --    t('_replace_later_to'),
  --  }),
  --  i(2),
  --  c(3, {
  --    t(''),
  --    t(', ')
  --  })
  --})
  --),
  --s({
  --  trig = 'bact',
  --  name = 'Broadcast ActionHelpers',
  --  dscr = 'Turbo Streams Broadcast ActionHelpers'
  --}, fmt([[
  --broadcast_{}
  --]], {
  --  c(1, {
  --    t('to'),
  --    t('action_to'),
  --    t('action_later_to'),
  --    t('after_to'),
  --    t('append_to'),
  --    t('append_later_to'),
  --    t('before_to'),
  --    t('before_later_to'),
  --    t('prepend_to'),
  --    t('prepend_later_to'),
  --    t('update_to'),
  --    t('update_later_to'),
  --    t('remove_to'),
  --    t('render_to'),
  --    t('render_later_to'),
  --    t('replace_to'),
  --    t('replace_later_to'),
  --    t('stream_to'),
  --  })
  --})
  --),
  --s({
  --  trig = 'dat',
  --  name = 'Data Attribute',
  --  dscr = 'insert data attribute into markup'
  --}, fmt([[data{}]], {
  --  c(1, {
  --    t(''),
  --    t(': '),
  --    c(1, {
  --      { t('controller=\''), i(1), t('\'') },
  --      { t('action=\''), i(1, 'data_action'), t('->'), i(2, 'stim_controller'), t('#'), i(3, 'stim_action'), t('\'') } }
  --    ) })
  --})
  --),
  --s({
  --  trig = 'dc',
  --  name = 'Data Controller',
  --  dscr = 'adds Data controller attribute'
  --},
  --  fmt([[data-controller = '{}']], { i(1) })
  --),
  --s({
  --  trig = 'da',
  --  name = 'Data Action',
  --  dscr = 'adds Data action attribute'
  --},
  --  fmt([[data-action='{}->{}#{}']], { i(1, 'DataAction'), i(2, 'StimulusController'), i(3, 'StimulusAction') })
  --),
  --s({
  --  trig = 'ren',
  --  name = 'render',
  --  dscr = 'add render helper tag'
  --},
  --  fmt([[<%= render {}, {}: @{} %>]], {
  --    i(1),
  --    i(2),
  --    rep(2)
  --  })
  --),
},
print("eruby snippets attached")

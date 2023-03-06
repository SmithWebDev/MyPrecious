return {
  --  require 'turbo_snippets',

  -- Link_to Helper snippet
  s(
    { trig = 'ltc', name = 'Link To', dscr = "Rails 'link to' helper" },
    fmt([[<%= link_to {}, {}{}{}%>]], {
      c(1, {
        { t("'"), i(1), t("'") },
        i(1),
      }),
      c(2, {
        { i(1) },
        { i(1), t('_path') },
        { i(1), t('_path('), i(2), t(')') },
        { t('new_'), i(1), t('_path') },
        { t('edit_'), i(1), t('_path('), i(2), t(')') },
        { t("'"), i(1), t("'") },
      }),
      c(3, {
        { i(1) },
        { t(", class: '"), i(1), t("' ") },
        { t(", class: '<%= "), i(1), t("%>' ") },
      }),
      c(4, {
        t(""),
        { i(1) },
        { t(', data: { turbo_frame: '), i(1), t(')}') },
        { t(', data: { turbo_frame: dom_id('), i(1), t(')}') },
        { t(', data: { turbo_method: dom_id('), i(1), t(')}') },
        { t(', data: { turbo_method: :delete') },
        { t(", data: { turbo_method: :delete, turbo_confirm: '"), i(1), t("'}") },
        { t('method: :delete') }
      }),
    })
  ),

  -- Turbo Frame Custom HTML Element
  s({ trig = 'tf', name = 'turbo frame', dscr = 'Turbo Frame Custom HTML Element' },
    fmt([[
      <turbo-frame{}{}{}>
        {}
      </turbo-frame>
    ]], {
      c(1, { t(''), { t(' id="'), i(1, 'id'), t('"') }, }),
      c(2, { t(''), { t(' src="'), i(1, 'source'), t('"') } }),
      c(3, { t(''), { t(' loading="lazy"') }, }),
      i(4)
    })
  ),

  --Data Attrs

  -- Attr - Data Action
  s({ trig = 'da', name = 'Data Action', dscr = 'Attr - Data Action' },
    fmt([[data-action="{}->{}#{}"]], {
      c(1, {
        i(1, 'event'),
        t('click'),
        t('hover'),
      }),
      i(2, 'controller name'),
      i(3, 'method'),
    })
  ),

  -- Attr - Data Controller
  s({ trig = 'dc', name = 'Data Controller', dscr = 'Attr - Data Controller' },
    fmt([[data-controller='{}']], {
      i(1, 'controller name')
    })
  ),

  -- Attr - Data Controller Target
  s({ trig = 'dct', name = 'Data Target', dscr = 'Attr - Data Controller Target' },
    fmt([[data-{}-target="{}"]], {
      i(1, 'controller name'),
      i(2, 'target'),
    })
  ),

  -- Attr - Data Controller Value
  s({
    trig = 'dcv',
    name = 'Data Controller Value',
    dscr = 'Attr - Data Controller Value'
  },
    fmt([[data-{}-{}-value="{}"]], {
      i(1, 'controller name'),
      i(2, 'value name'),
      i(3, 'value'),
    })
  ),

  --Attr - Link attr for turbo response
  s({ trig = 'dtf', name = 'Data Turbo Frame', dscr = 'Turbo link attr' },
    fmt([[data-turbo-frame="{}"]], {
      c(1, {
        i(1),
        t('_top'),
      })
    })
  ),

  --Attr - Dom_ID attr
  s({ trig = 'dmid', name = 'Dom Id Selector', dscr = 'Dom_ID attr' },
    fmt([[dom_id(@{})]], {
      i(1)
    })
  ),

  -- Turbo stream tag with action
  s({ trig = 'tsa', name = 'Turbo Stream w/ Action', dscr = 'Turbo stream tag with action' },
    fmt([[
    <turbo-stream action='{}' {}{}>
      {}
    </turbo-stream>
    ]], {
      c(1, {
        i(1, 'custom action'),
        t('append'),
        t('prepend'),
        t('before'),
        t('after'),
        t('replace'),
        t('update'),
        t('remove')
      }),
      c(2, {
        { t("target='"), i(1, 'target id'), t("' ") },
        { t("targets='"), i(1, 'css_selector_class'), t("' ") },
        { t("message='"), i(1, 'custom message'), t("' ") },
        { t("text='"), i(1, 'custom text'), t("' ") },
        { t("target='"), i(1, 'target id'), t("' "), t("message='"), i(2, 'custom message'), t("' ") },
        { t("targets='"), i(1, 'css_selector_class'), t("' "), t("message='"), i(2, 'custom message'), t("' ") },
        { t("target='"), i(1, 'target id'), t("' "), t("text='"), i(2, 'custom text'), t("' ") },
        { t("targets='"), i(1, 'css_selector_class'), t("' "), t("text='"), i(2, 'custom text'), t("' ") },
      }),
      c(3, {
        t(""),
        { t("class='"), i(1, 'css_class'), t("' ") },
      }),
      i(4)
    })
  ),
}

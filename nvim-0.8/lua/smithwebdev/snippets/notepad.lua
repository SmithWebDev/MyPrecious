s(
  {
  trig = 'ltc',
  name = 'Link To',
  dscr = "Rails 'link to' helper"
},
  fmt([[<%= link_to '{}', {} %>]], {
    i(1),
    c(2,{
      {i(1)},
      {i(1),t('_path')},
      {i(1),t('_path('), i(2), t(')')},
    })
  })
)

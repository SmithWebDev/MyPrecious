return {
  s({
    trig = 'imp',
    name = 'import',
    dscr = 'import keyword for JS'
  },
    fmt([[import "{}";]], { i(1) })
  ),
  s({
    trig = 'impf',
    name = 'import from module',
    dscr = 'import keyword'
  },
    fmt([[import {} from "{}";]], { i(2), i(1) })
  ),
  s({
    trig = 'req',
    name = 'require',
    dscr = 'require syntax for javascript'
  },
    { t("require('"), i(1), t("\')") }
  ),
  s({
    trig = 'sa',
    name = 'Stream Action',
    dscr = 'custom turbo stream setup'
  },
    fmt([[
    StreamActions.{} = function() {{
      {}
    }}
    ]], {
        i(1, 'custom turbo stream name'),
        i(2)
      })
  ),
},
    print("javascript snippets attached")

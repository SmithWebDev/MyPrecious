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
},
    print("javascript snippets attached")

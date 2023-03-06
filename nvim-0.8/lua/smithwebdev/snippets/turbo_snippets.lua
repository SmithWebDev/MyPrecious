return {
  s({
    trig = 'tf',
    name = 'turbo frame',
    dscr = 'Turbo Frame Custom HTML Element'
  },
    fmt([[
      <turbo-frame{}>
        {}
      </turbo-frame
    ]], {
        i(1),
        i(2)
      })
  ),
},
print('Turbo Snippets Connected')


return {
  -- Markdown Language Block
  s({
    trig = 'mlb',
    name = 'Markdown language block',
    dscr = 'Markdown Language Block'
  },
    fmt([[
      ```{}
      {}
      ```
      ]], {
        c(1,{
          i(1),
          t('rb'),
        }),
        i(2),
      })
  ),
}

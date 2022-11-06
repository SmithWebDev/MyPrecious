return {
  s({
    trig = 'tracker',
    name = 'tracker',
    dscr = 'creates template for job tracking'
  },
    fmt([[
    **As a(n)** {},
    **When** {}
    **I want to** {}
    **In order to** {}

    **Acceptance Criteria**
    - {}

    **Why**
    - {}

    **Notes**
    - {}

    **Dev Notes**
    - {}

    **Test Notes**
    ]], {i(1), i(2), i(3), i(4), i(5), i(6), i(7), i(8), })
  ),
  s({
    trig = 'com',
    name = 'Conventional Commits',
    dscr = 'Commit message structure'
  },
    fmt([[
    {}: {}
    ]],
      {
        c(1,{
          t('Feature'),
          t('Fix'),
          t('Docs'),
          t('Style'),
          t('Refactor'),
          t('Performance'),
          t('Test'),
          t('Build'),
          t('CI'),
          t('Chore'),
          t('Revert')
        }),
        i(2)
      })
  ),
}

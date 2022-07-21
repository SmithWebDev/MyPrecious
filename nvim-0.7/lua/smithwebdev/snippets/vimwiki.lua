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
}

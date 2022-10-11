return {
  s({
    trig = 'RSpec',
    name = 'Rspec feature',
    dscr = 'Initialize Rspec test file'
  },
    fmt([[
    RSpec.feature '{}' do
      scenario '{}' do
        {}
      end
    end
    ]], { i(1), i(2), i(3) })
  ),
  s({
    trig = 'visit',
    name = 'visit',
    dscr = 'visit helper'
  },
    fmt([[ visit '{}']], { i(1) })
  ),
  s({
    trig = 'click',
    name = 'click on/button',
    dscr = 'click on/button  helper'
  },
    fmt([[ click_{} '{}']], { c(1, { t('on'), t('button') }), i(2) })
  ),
  s({
    trig = 'fill',
    name = 'fill in',
    dscr = 'fill in parameter'
  },
    fmt([[ fill_in '{}', with: '{}']], { i(1), i(2) })
  ),
},
    print('Rspec Snippets')

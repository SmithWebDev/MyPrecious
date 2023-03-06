return {
  -- Model Validations
  s({ trig = 'val', name = 'Model Validation', dscr = 'Validates' },
    fmt([[validates :{}]], {
      i(1)
    })
  ),

  -- Model Before Validation
  s({ trig = 'bval', name = 'Before Model Validation', dscr = 'Before Validation' },
    fmt([[before_validation :{}]], {
      i(1)
    })
  ),

  -- Resource Routes
  s({ trig = 'res', name = 'Resources', dscr = 'Resource Routes' },
    fmt([[resources :{}]], {
      i(1)
    })
  ),

  -- Before Action
  s({ trig = 'ba', name = 'Before Action', dscr = 'Before Action' },
    fmt([[before_action :{}]], {
      c(1, {
        t(''),
        i(1),
        { i(1), t(', only: ['), i(2), t(']') },
      })
    })
  ),

  -- Redirect_to
  s({ trig = 'rdt', name = 'Redirect To helper', dscr = 'Redirect_to' },
    fmt([[redirect_to {}_path{}]], {
      i(1),
      c(2, {
        t(''),
        { t(", notice: '"), i(1), t("'") }
      }),
    })
  ),

  -- Params private method
  s({ trig = 'prm', name = 'Controller Params method', dscr = 'Params private method' },
    fmt([[
      def {}_params
        params.require(:{}).permit(:{})
      end
      ]], {
      i(1),
      i(2),
      i(3),
    })
  ),

  -- Ruby Model Association - Has Many
  s({ trig = 'hm', name = 'Has Many', dscr = 'Ruby Model Association - Has Many' },
    fmt([[has_many :{}]], {
      c(1, {
        i(1),
        { i(1), t(', through: :'), i(2) },
        { i(1), t(', dependent: :'), i(2) }
      }),
    })
  ),

  -- Secure Password helper
  s({
    trig = 'hsp',
    name = 'Has Secure Password',
    dscr = 'Secure Password helper'
  },
    fmt([[
    has_secure_password
    validates :password,
      presence: true
    ]], {})
  ),

  -- Strip Whitespace
  s({ trig = 'swp', name = 'Strip Whitespace', dscr = 'Strip Whitespace' },
    fmt([[
    def strip_extraneous_spaces
      self.{} = self.{}&.strip
      self.{} = self.{}&.strip
    end
    ]], {
      i(1),
      rep(1),
      i(2),
      rep(2)
    })
  ),
}

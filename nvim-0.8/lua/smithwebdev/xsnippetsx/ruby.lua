return {
  s({
    trig = 'ba',
    name = 'Before Action',
    dscr = 'Model Before Action'
  }, {
    t('before_action ')
  }),
  s({
    trig = 'val',
    name = 'validates',
    dscr = 'addes validates object to model'
  }, {
    t('validates :')
  }),
  s({
    trig = 'bt',
    name = 'belongs_to',
    dscr = 'Belongs To model association'
  }, {
    t('belongs_to :')
  }),
  s({
    trig = 'hm',
    name = 'Has Many',
    dscr = 'Has Many model association'
  }, {
    t('has_many :')
  }),
  s({
    trig = 'dep',
    name = 'Dependent',
    dscr = 'Dependent attribute for model'
  }, {
    t('dependent: '),
    c(1, {
      t(':destroy'),
      t(':'),
      t('')
    })
  }),
  s({
    trig = 'pres',
    name = 'presence',
    dscr = 'Presence attribute for model'
  }, fmt([[{}]], {
    c(1, {
      t('presence: true'),
      t('presence: false')
    }
    ) }
  )),
  s({
    trig = 'tsat',
    name = 'Turbo Stream Action Tag',
    dscr = 'def custom reusable turbo stream actions'
  },
    fmt([[
    turbo_stream_action_tag :{}, {}: {}
    ]], {
        i(1, 'custom action name'),
        i(2, 'custom attribute name'),
        rep(2)
      })
  ),
  s({
    trig = 'ftstream',
    name = 'format turbo stream',
    dscr = 'adds turbo stream attribute for rails controllers'
  },
    fmt([[format.turbo_stream {{ {} }}]], { i(1) })
  ),
  s({
    trig = 'resto',
    name = 'respond_to helper',
    dscr = 'adds respond_to helper in rails controller'
  },
    fmt([[
      respond_to do |format|
        format.html {{ redirect_to {}_path{}, notice: '{} was successfully {}!' }}
        format.turbo_stream {{ flash.now[:notice] = '{} was successfully {}!' }}
      end
    ]], {
      i(1),
      i(2),
      i(3),
      c(4, {
        t('created'),
        t('updated'),
        t('deleted')
      }),
      rep(3),
      rep(4)
    })
  ),
  s({
    trig = 'ue',
    name = 'status error',
    dscr = 'status fallback for error'
  },
    fmt([[ render :{}, status: :unprocessable_entity]], { i(1) })
  ),
  s({
    trig = 'conres',
    name = 'Controller Respond',
    dscr = 'Respond_To format for controller actions'
  },
    fmt([[
      respond_to do |format|
        format.html {{ redirect_to {}_path(@{}), notice: '{} was successfully {}.' }}
        format.turbo_stream {{ flash.now[:notice] = '{} was successfully {}.' }}
      end
    ]], {
      i(1),
      rep(1),
      i(2),
      i(3),
      rep(2),
      rep(3)
    })
  ),
  s({
    trig = 'bind',
    name = 'Pry Binding',
    dscr = 'Insert Binding.pry'
  },
    { t('binding.pry') }
  ),
},
    print('ruby snippets attached')

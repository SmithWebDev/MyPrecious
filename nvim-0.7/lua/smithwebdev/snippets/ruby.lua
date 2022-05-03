return{
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
      t('dependent :')
    }),
  s({
    trig = 'pres',
    name = 'presence',
    dscr = 'Presence attribute for model'
  }, fmt([[{}]], {
      c(1,{
        t('presence: true'),
        t('presence: false')
      }
      )}
  )),
},
  print('ruby snippets attached')

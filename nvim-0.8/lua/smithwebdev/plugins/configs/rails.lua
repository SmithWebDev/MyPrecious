local M = {}

--vim.g.blockle_mapping = '<leader>bl'
vim.g.rufo_auto_formatting = 1

M.plugin = {
  'tpope/vim-rails',

  config = function()
    local u = require 'smithwebdev.core.utils'
    local nnoremap = u.nnoremap
    local vnoremap = u.vnoremap

    -- keybindings
    nnoremap('<leader><leader>rc',     '<cmd>Console!<CR>',                                { desc = 'Open Rails Console New Tmux Window' })
    nnoremap('<leader><leader>rs',     '<cmd>Server!<CR>',                                 { desc = 'Open Rails Server New Tmux Window' })


    nnoremap('<leader><leader>rD',     ':Destroy<Space>',                                  { desc = 'Rails Destroy Command' })
    nnoremap('<leader><leader>rr',     ':!rails<Space>',                                   { desc = 'Rails CLI command' })
    nnoremap('<leader><leader>rac',    '!rails assets:clobber<CR>',                        { desc = 'Rails Assets Clobber'})
    nnoremap('<leader><leader>rap',    '!rails assets:precomile<CR>',                      { desc = 'Rails Assets Precompile'})
    nnoremap('<leader><leader>rrdc',   ':!rails dev:cache',                                { desc = 'Rails CLI command to cache dev env' })
    nnoremap('<leader><leader>rtlc',   ':!rails tmp:clear log:clear<CR>',                  { desc = 'Removed temp and log files from project' })

    -- Rails Bundler Commands
    nnoremap('<leader><leader>rba',    ':!bundle add<Space>',                              { desc = 'Bundle Add Command' })
    nnoremap('<leader><leader>rbi',    ':!bundle install<CR>',                             { desc = 'Bundle Install Command' })
    nnoremap('<leader><leader>rbI',    ':!bundle info<CR>',                                { desc = 'Bundle Info Command' })
    nnoremap('<leader><leader>rbu',    ':!bundle update<CR>',                              { desc = 'Bundle Update Command' })

    -- Rails Database Commands
    nnoremap('<leader><leader>rdba',   ':!rails db:drop db:create db:migrate<CR>',         { desc = 'Rails DB:Drop Create & Migrate Command' })
    nnoremap('<leader><leader>rdbA',   ':!rails db:drop db:create db:migrate db:seed<CR>', { desc = 'Rails DB:Drop Create, Migrate, & Seed Command' })
    nnoremap('<leader><leader>rdbc',   ':!rails db:create<CR>',                            { desc = 'Rails DB:Create Command' })
    nnoremap('<leader><leader>rdbd',   ':!rails db:drop<CR>',                              { desc = 'Rails DB:Drop Command' })
    nnoremap('<leader><leader>rdbm',   ':!rails db:migrate<CR>',                           { desc = 'Rails DB:Migrate Command' })
    nnoremap('<leader><leader>rdbr',   ':!rails db:rollback<CR>',                          { desc = 'Rails DB:Rollback Command' })
    nnoremap('<leader><leader>rdbs',   ':!rails db:setup<CR>',                             { desc = 'Rails DB:Setup Command' })
    nnoremap('<leader><leader>rdbS',   ':!rails db:seed<CR>',                              { desc = 'Rails DB:Seed Command' })

    -- Rails Generators Commands
    nnoremap('<leader><leader>rG',     ':Generate<Space>',                                 { desc = 'Rails Generate Command' })
    nnoremap('<leader><leader>rgc',    ':Generate controller<Space>',                      { desc = 'Rails Generate Controller Command' })
    nnoremap('<leader><leader>rgch',   ':Generate channel<Space>',                         { desc = 'Rails Generate Channel Command' })
    nnoremap('<leader><leader>rgh',    ':Generate helper<Space>',                          { desc = 'Rails Generate Helper Command' })
    nnoremap('<leader><leader>rgj',    ':Generate job<Space>',                             { desc = 'Rails Generate Job Command' })
    nnoremap('<leader><leader>rgjb',   ':Generate jbuilder<Space>',                        { desc = 'Rails Generate Jbuilder Command' })
    nnoremap('<leader><leader>rgm',    ':Generate model<Space>',                           { desc = 'Rails Generate Model Command' })
    nnoremap('<leader><leader>rgmail', ':Generate mailer<Space>',                          { desc = 'Rails Generate Mailer Command' })
    nnoremap('<leader><leader>rgmbox', ':Generate mailbox<Space>',                         { desc = 'Rails Generate Mailbox Command' })
    nnoremap('<leader><leader>rgmig',  ':Generate migration<Space>',                       { desc = 'Rails Generate Migration Command' })
    nnoremap('<leader><leader>rgr',    ':Generate resource<Space>',                        { desc = 'Rails Generate Resource Command' })
    nnoremap('<leader><leader>rgrc',   ':Generate responders_controller<Space>',           { desc = 'Rails Generate Responders Controller Command' })
    nnoremap('<leader><leader>rgs',    ':Generate scaffold<Space>',                        { desc = 'Rails Generate Scaffold Command' })
    nnoremap('<leader><leader>rgsc',   ':Generate scaffold_controller<Space>',             { desc = 'Rails Generate Scaffold Controller Command' })
    nnoremap('<leader><leader>rgst',   ':Generate system_test<Space>',                     { desc = 'Rails Generate System Test Command' })
    nnoremap('<leader><leader>rgt',    ':Generate task<Space>',                            { desc = 'Rails Generate Task Command' })
    --nnoremap('',                     '')
    --nnoremap('',                     '')


    -- Invoking :Rails with no arguments runs a default task.
    nnoremap('<leader><leader>rR',     '<cmd>Rails<CR> | :set nowrap<CR>')
    -- File,                           Task ~
    -- test/*_test.rb,                 test TEST=test/*_test.rb
    -- spec/*_spec.rb,                 spec SPEC=spec/*_spec.rb
    -- features/*.feature,             cucumber FEATURE=features/*.feature
    -- app/*.rb,                       test TEST=... | spec SPEC=...
    -- test/fixtures/*.yml,            db:fixtures:load FIXTURES=*
    -- config.ru,                      middleware
    -- config/routes.rb,               routes
    -- db/migrate/*_*.rb,              db:migrate:redo VERSION=*
    -- db/schema.rb,                   db:migrate:status
    -- db/seeds.rb,                    db:seed
    -- README,                         about



    -- Current file,                   Alternate file(:A),                                 Related file(:R)
    -- model,                          unit test,                                          schema definition
    -- controller (in method),         functional test,                                    template (view)
    -- template (view),                functional test,                                    controller (jump to method)
    -- migration,                      previous migration,                                 next migration
    -- database.yml,                   database.example.yml,                               environments/*.rb

    -- Edits to "Alternative" file in various locations
    nnoremap('<leader><leader>rA',     '<cmd>A<CR>')
    nnoremap('<leader><leader>rae',    '<cmd>AE<CR>',                                      { desc = 'edit alternate file' })
    nnoremap('<leader><leader>ras',    '<cmd>AS<CR>',                                      { desc = 'edit alternate in h split' })
    nnoremap('<leader><leader>rav',    '<cmd>AV<CR>',                                      { desc = 'edit alternate in tab' })
    nnoremap('<leader><leader>rat',    '<cmd>AT<CR>',                                      { desc = 'edit alternate in v split' })


    -- Edits to "Relative" file in various locations
    nnoremap('<leader><leader>re',     '<cmd>R<CR>')
    nnoremap('<leader><leader>ree',    '<cmd>RE<CR>',                                      { desc = 'edit relative file' })
    nnoremap('<leader><leader>res',    '<cmd>RS<CR>',                                      { desc = 'edit relative in h split' })
    nnoremap('<leader><leader>rev',    '<cmd>RV<CR>',                                      { desc = 'edit relative in tab' })
    nnoremap('<leader><leader>ret',    '<cmd>RT<CR>',                                      { desc = 'edit relative in v split' })


    -- Partial Extraction
    vnoremap('<leader><leader>rex',    ':Extract ',                                        { desc = 'extract to partial' })

    -- Rfactory
    nnoremap('<leader><leader>rf',     '<cmd>Rfactory<CR>',                                { desc = 'Edit Factory File' })
    nnoremap('<leader><leader>rfs',    '<cmd>RSfactory<CR>',                               { desc = 'Edit Factory File in H Split' })
    nnoremap('<leader><leader>rfv',    '<cmd>RVfactory<CR>',                               { desc = 'Edit Factory File in V Split' })
    nnoremap('<leader><leader>rft',    '<cmd>RTfactory<CR>',                               { desc = 'Edit Factory File in Tab' })

    -- Preview Page
    nnoremap('<leader><leader>rp',     ':Preview<CR>',                                     { desc = 'open web browser for current view' })
    -- MiniTest
    nnoremap('<leader><leader>rts',    ':!rails test:',                                    { desc = 'Rails Test:{directory}' })


    -- Annotate Gem
    nnoremap('<leader><leader>rgAi',   ':Generate annotate:install<CR>',                   { desc = 'Rails Generate Annotate Install' })

    -- Devise Gem
    nnoremap('<leader><leader>rgDi',   ':Generate devise:install <CR>',                    { desc = 'Rails Generate Devise Install' })
    nnoremap('<leader><leader>rgDC',   ':Generate devise:controllers<Space>',              { desc = 'Rails Generate Devise Controllers' })
    nnoremap('<leader><leader>rgDM',   ':Generate devise<Space>',                          { desc = 'Rails Generate Devise Model' })
    nnoremap('<leader><leader>rgDV',   ':Generate devise:views<CR>',                       { desc = 'Rails Generate Devise Views' })

    -- GraphQL Ruby
    nnoremap('<leader><leader>rgGQLi', ':Generate graphql:install <CR>',                   { desc = 'Rails Generate GraphQL Install' })

    -- Guard
    nnoremap('<leader><leader>rgGi',   ':!guard init && bundle binstubs guard<CR>',        { desc = 'Initialize Guard' })

    -- LiveReload Gem
    nnoremap('<leader><leader>rLRi',   ':!rails livereload:install<CR>',                   { desc = 'Install Rails Live Reload' })
    nnoremap('<leader><leader>rLRD',   ':!rails livereload:disable<CR>',                   { desc = 'Disable Rails Live Reload' })
    nnoremap('<leader><leader>rLRE',   ':!rails livereload:enable<CR>',                    { desc = 'Enable Rails Live Reload' })

    -- Rspec Gem
    nnoremap('<leader><leader>rgRCH',  ':Generate rspec:channel<CR>',                      { desc = 'Rails Generate Rspec Channel' })
    nnoremap('<leader><leader>rgRC',   ':Generate rspec:controller<CR>',                   { desc = 'Rails Generate Rspec Controller' })
    nnoremap('<leader><leader>rgRF',   ':Generate rspec:feature<CR>',                      { desc = 'Rails Generate Rspec Feature' })
    nnoremap('<leader><leader>rgRG',   ':Generate rspec:generator<CR>',                    { desc = 'Rails Generate Rspec Generator' })
    nnoremap('<leader><leader>rgRH',   ':Generate rspec:helper<CR>',                       { desc = 'Rails Generate Rspec Helper' })
    nnoremap('<leader><leader>rgRi',   ':Generate rspec:install<CR>',                      { desc = 'Rails Generate Rspec Install' })
    nnoremap('<leader><leader>rgRI',   ':Generate rspec:integration<CR>',                  { desc = 'Rails Generate Rspec Integration' })
    nnoremap('<leader><leader>rgRJ',   ':Generate rspec:job<CR>',                          { desc = 'Rails Generate Rspec Job' })
    nnoremap('<leader><leader>rgRM',   ':Generate rspec:mailer<CR>',                       { desc = 'Rails Generate Rspec Mailer' })
    nnoremap('<leader><leader>rgRMB',  ':Generate rspec:mailbox<CR>',                      { desc = 'Rails Generate Rspec Mailbox' })
    nnoremap('<leader><leader>rgRMod', ':Generate rspec:model<CR>',                        { desc = 'Rails Generate Rspec Model' })
    nnoremap('<leader><leader>rgRR',   ':Generate rspec:request<CR>',                      { desc = 'Rails Generate Rspec Request' })
    nnoremap('<leader><leader>rgRS',   ':Generate rspec:scaffold<CR>',                     { desc = 'Rails Generate Rspec Scaffold' })
    nnoremap('<leader><leader>rgRSY',  ':Generate rspec:system<CR>',                       { desc = 'Rails Generate Rspec System' })
    nnoremap('<leader><leader>rgRV',   ':Generate rspec:view<CR>',                         { desc = 'Rails Generate Rspec View' })

    -- Rubocop Bindings
    nnoremap('<leader><leader>rl',     ':!rubocop -a %<CR>',                               { desc = 'Rubocop lint command for current file'})

    -- Simple Form
    nnoremap('<leader><leader>rgSFi',  ':Generate simple_form:install<CR>',                { desc = 'Rails Generate Simple Form Install' })

    -- Stimulus/StimulusReflex
    nnoremap('<leader><leader>rbaSR',  ':!bundle add stimulus_reflex<CR>',                 { desc = 'Add Stimulus Reflex to Project'})
    nnoremap('<leader><leader>rSRi',   ':!rails stimulus_reflex:install<CR>',              { desc = 'Install StimulusReflex' })
    nnoremap('<leader><leader>rgSRI',  ':!rails generate stimulus_reflex:initializer<CR>', { desc = 'Create StimulusReflex Initializer' })
    nnoremap('<leader><leader>rgSt',   ':Generate stimulus<Space>',                        { desc = 'Rails Generate stimulus #{model}_controller' })
    nnoremap('<leader><leader>rgStmu', ':!rails stimulus:manifest:update',                 { desc = 'Rails update stimulus controllers' })
    nnoremap('<leader><leader>rDs',    ':Destroy stimulus<Space>',                         { desc = 'Rails Destroy Stimulus Controller Command' })


    -- Run Ctags for Ruby/Rails program, includes gems
    --nnoremap('<leader><leader>rt', ':!ctags -R --output-format=json --exclude=node_modules--exclude=.git --exclude=log .  -f .tags $(bundle list --paths) <CR>') --,  create ctags for project incl bundled gems
    --nnoremap('<leader><leader>rt', ':!ctags -R --exclude=node_modules --exclude=.git --exclude=log .  -f .tags $(bundle list --paths) <CR>') --,  create ctags for project incl bundled gems
    nnoremap('<leader><leader>rt',  ':!ctags -R -f --exclude=node_modules --exclude=.git --exclude=log .tags && bundle show --paths | xargs ctags -R -a -f .tags <CR>')
  end
}

return M

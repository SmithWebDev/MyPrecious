
-- keybindings
vim.keymap.set('n', '<leader><leader>rc',     '<cmd>Console!<CR>',                                { desc = 'Open Rails Console New Tmux Window', silent = true  })
vim.keymap.set('n', '<leader><leader>rs',     '<cmd>Server!<CR>',                                 { desc = 'Open Rails Server New Tmux Window', silent = true  })


vim.keymap.set('n', '<leader><leader>rD',     ':Destroy<Space>',                                  { desc = 'Rails Destroy Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rr',     ':!rails<Space>',                                   { desc = 'Rails CLI command', silent = true  })
vim.keymap.set('n', '<leader><leader>rac',    ':!rails assets:clobber<CR>',                       { desc = 'Rails Assets Clobber', silent = true })
vim.keymap.set('n', '<leader><leader>rap',    ':!rails assets:precomile<CR>',                     { desc = 'Rails Assets Precompile', silent = true })
vim.keymap.set('n', '<leader><leader>rrdc',   ':!rails dev:cache',                                { desc = 'Rails CLI command to cache dev env', silent = true  })
vim.keymap.set('n', '<leader><leader>rtlc',   ':!rails tmp:clear log:clear<CR>',                  { desc = 'Removed temp and log files from project', silent = true  })

-- Rails Module Commands
vim.keymap.set('n', '<leader><leader>rASi',   ':!rails active_storage:install<CR>',                { desc = 'Install Rails Active Storage module', silent = true  })

-- Rails Bundler Commands
vim.keymap.set('n', '<leader><leader>rba',    ':!bundle add<Space>',                              { desc = 'Bundle Add Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rbi',    ':!bundle install<CR>',                             { desc = 'Bundle Install Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rbI',    ':!bundle info<CR>',                                { desc = 'Bundle Info Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rbu',    ':!bundle update<CR>',                              { desc = 'Bundle Update Command', silent = true  })

-- Rails Database Commands
vim.keymap.set('n', '<leader><leader>rdba',   ':!rails db:drop db:create db:migrate<CR>',         { desc = 'Rails DB:Drop Create & Migrate Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rdbA',   ':!rails db:drop db:create db:migrate db:seed<CR>', { desc = 'Rails DB:Drop Create, Migrate, & Seed Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rdbc',   ':!rails db:create<CR>',                            { desc = 'Rails DB:Create Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rdbd',   ':!rails db:drop<CR>',                              { desc = 'Rails DB:Drop Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rdbm',   ':!rails db:migrate<CR>',                           { desc = 'Rails DB:Migrate Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rdbr',   ':!rails db:rollback<CR>',                          { desc = 'Rails DB:Rollback Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rdbs',   ':!rails db:setup<CR>',                             { desc = 'Rails DB:Setup Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rdbS',   ':!rails db:seed<CR>',                              { desc = 'Rails DB:Seed Command', silent = true  })

-- Rails Generators Commands
vim.keymap.set('n', '<leader><leader>rG',     ':Generate<Space>',                                 { desc = 'Rails Generate Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rgc',    ':Generate controller<Space>',                      { desc = 'Rails Generate Controller Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rgch',   ':Generate channel<Space>',                         { desc = 'Rails Generate Channel Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rgh',    ':Generate helper<Space>',                          { desc = 'Rails Generate Helper Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rgj',    ':Generate job<Space>',                             { desc = 'Rails Generate Job Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rgjb',   ':Generate jbuilder<Space>',                        { desc = 'Rails Generate Jbuilder Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rgm',    ':Generate model<Space>',                           { desc = 'Rails Generate Model Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rgmail', ':Generate mailer<Space>',                          { desc = 'Rails Generate Mailer Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rgmbox', ':Generate mailbox<Space>',                         { desc = 'Rails Generate Mailbox Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rgmig',  ':Generate migration<Space>',                       { desc = 'Rails Generate Migration Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rgr',    ':Generate resource<Space>',                        { desc = 'Rails Generate Resource Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rgrc',   ':Generate responders_controller<Space>',           { desc = 'Rails Generate Responders Controller Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rgs',    ':Generate scaffold<Space>',                        { desc = 'Rails Generate Scaffold Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rgsc',   ':Generate scaffold_controller<Space>',             { desc = 'Rails Generate Scaffold Controller Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rgst',   ':Generate system_test<Space>',                     { desc = 'Rails Generate System Test Command', silent = true  })
vim.keymap.set('n', '<leader><leader>rgt',    ':Generate task<Space>',                            { desc = 'Rails Generate Task Command', silent = true  })
--vim.keymap.set('n', '',                     '')

-- Rails Initial Setup (PostgreSQL)
vim.keymap.set('n', '<leader><leader>rbs',    '!bin/setup',                                       { desc = 'Rails Initial Setup Command', silent = true })


-- Invoking :Rails with no arguments runs a default task.
vim.keymap.set('n', '<leader><leader>rR',     '<cmd>Rails<CR> | :set nowrap<CR>')
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
vim.keymap.set('n', '<leader><leader>ra',     '<cmd>A<CR>')
vim.keymap.set('n', '<leader><leader>rae',    '<cmd>AE<CR>',                                      { desc = 'edit alternate file', silent = true  })
vim.keymap.set('n', '<leader><leader>ras',    '<cmd>AS<CR>',                                      { desc = 'edit alternate in h split', silent = true  })
vim.keymap.set('n', '<leader><leader>rav',    '<cmd>AV<CR>',                                      { desc = 'edit alternate in tab', silent = true  })
vim.keymap.set('n', '<leader><leader>rat',    '<cmd>AT<CR>',                                      { desc = 'edit alternate in v split', silent = true  })


-- Edits to "Relative" file in various locations
vim.keymap.set('n', '<leader><leader>re',     '<cmd>R<CR>')
vim.keymap.set('n', '<leader><leader>ree',    '<cmd>RE<CR>',                                      { desc = 'edit relative file', silent = true  })
vim.keymap.set('n', '<leader><leader>res',    '<cmd>RS<CR>',                                      { desc = 'edit relative in h split', silent = true  })
vim.keymap.set('n', '<leader><leader>rev',    '<cmd>RV<CR>',                                      { desc = 'edit relative in tab', silent = true  })
vim.keymap.set('n', '<leader><leader>ret',    '<cmd>RT<CR>',                                      { desc = 'edit relative in v split', silent = true  })


-- Partial Extraction
vim.keymap.set('v', '<leader><leader>rex',    ':Extract ',                                        { desc = 'extract to partial', silent = true })

-- Rfactory
vim.keymap.set('n', '<leader><leader>rf',     '<cmd>Rfactory<CR>',                                { desc = 'Edit Factory File', silent = true  })
vim.keymap.set('n', '<leader><leader>rfs',    '<cmd>RSfactory<CR>',                               { desc = 'Edit Factory File in H Split', silent = true  })
vim.keymap.set('n', '<leader><leader>rfv',    '<cmd>RVfactory<CR>',                               { desc = 'Edit Factory File in V Split', silent = true  })
vim.keymap.set('n', '<leader><leader>rft',    '<cmd>RTfactory<CR>',                               { desc = 'Edit Factory File in Tab', silent = true  })

-- Preview Page
vim.keymap.set('n', '<leader><leader>rp',     ':Preview<CR>',                                     { desc = 'open web browser for current view', silent = true  })
-- MiniTest
vim.keymap.set('n', '<leader><leader>rts',    ':!rails test:',                                    { desc = 'Rails Test:{directory}', silent = true  })


-- Annotate Gem
vim.keymap.set('n', '<leader><leader>rgAi',   ':Generate annotate:install<CR>',                   { desc = 'Rails Generate Annotate Install', silent = true  })

-- Devise Gem
vim.keymap.set('n', '<leader><leader>rgDi',   ':Generate devise:install <CR>',                    { desc = 'Rails Generate Devise Install', silent = true  })
vim.keymap.set('n', '<leader><leader>rgDC',   ':Generate devise:controllers<Space>',              { desc = 'Rails Generate Devise Controllers', silent = true  })
vim.keymap.set('n', '<leader><leader>rgDM',   ':Generate devise<Space>',                          { desc = 'Rails Generate Devise Model', silent = true  })
vim.keymap.set('n', '<leader><leader>rgDV',   ':Generate devise:views<CR>',                       { desc = 'Rails Generate Devise Views', silent = true  })

-- GraphQL Ruby
vim.keymap.set('n', '<leader><leader>rgGQLi', ':Generate graphql:install <CR>',                   { desc = 'Rails Generate GraphQL Install', silent = true  })

-- Guard
vim.keymap.set('n', '<leader><leader>rgGi',   ':!guard init && bundle binstubs guard<CR>',        { desc = 'Initialize Guard', silent = true  })

-- LiveReload Gem
vim.keymap.set('n', '<leader><leader>rgLRi',   ':!rails livereload:install<CR>',                   { desc = 'Install Rails Live Reload', silent = true  })
vim.keymap.set('n', '<leader><leader>rgLRD',   ':!rails livereload:disable<CR>',                   { desc = 'Disable Rails Live Reload', silent = true  })
vim.keymap.set('n', '<leader><leader>rgLRE',   ':!rails livereload:enable<CR>',                    { desc = 'Enable Rails Live Reload', silent = true  })

-- Rspec Gem
vim.keymap.set('n', '<leader><leader>rgRCH',  ':Generate rspec:channel<CR>',                      { desc = 'Rails Generate Rspec Channel', silent = true  })
vim.keymap.set('n', '<leader><leader>rgRC',   ':Generate rspec:controller<CR>',                   { desc = 'Rails Generate Rspec Controller', silent = true  })
vim.keymap.set('n', '<leader><leader>rgRF',   ':Generate rspec:feature<CR>',                      { desc = 'Rails Generate Rspec Feature', silent = true  })
vim.keymap.set('n', '<leader><leader>rgRG',   ':Generate rspec:generator<CR>',                    { desc = 'Rails Generate Rspec Generator', silent = true  })
vim.keymap.set('n', '<leader><leader>rgRH',   ':Generate rspec:helper<CR>',                       { desc = 'Rails Generate Rspec Helper', silent = true  })
vim.keymap.set('n', '<leader><leader>rgRi',   ':Generate rspec:install<CR>',                      { desc = 'Rails Generate Rspec Install', silent = true  })
vim.keymap.set('n', '<leader><leader>rgRI',   ':Generate rspec:integration<CR>',                  { desc = 'Rails Generate Rspec Integration', silent = true  })
vim.keymap.set('n', '<leader><leader>rgRJ',   ':Generate rspec:job<CR>',                          { desc = 'Rails Generate Rspec Job', silent = true  })
vim.keymap.set('n', '<leader><leader>rgRM',   ':Generate rspec:mailer<CR>',                       { desc = 'Rails Generate Rspec Mailer', silent = true  })
vim.keymap.set('n', '<leader><leader>rgRMB',  ':Generate rspec:mailbox<CR>',                      { desc = 'Rails Generate Rspec Mailbox', silent = true  })
vim.keymap.set('n', '<leader><leader>rgRMod', ':Generate rspec:model<CR>',                        { desc = 'Rails Generate Rspec Model', silent = true  })
vim.keymap.set('n', '<leader><leader>rgRR',   ':Generate rspec:request<CR>',                      { desc = 'Rails Generate Rspec Request', silent = true  })
vim.keymap.set('n', '<leader><leader>rgRS',   ':Generate rspec:scaffold<CR>',                     { desc = 'Rails Generate Rspec Scaffold', silent = true  })
vim.keymap.set('n', '<leader><leader>rgRSY',  ':Generate rspec:system<CR>',                       { desc = 'Rails Generate Rspec System', silent = true  })
vim.keymap.set('n', '<leader><leader>rgRV',   ':Generate rspec:view<CR>',                         { desc = 'Rails Generate Rspec View', silent = true  })

-- Rubocop Bindings
vim.keymap.set('n', '<leader><leader>rl',     ':!rubocop -a %<CR>',                               { desc = 'Rubocop lint command for current file', silent = true })
vim.keymap.set('n', '<leader><leader>rL',     ':!rubocop -A %<CR>',                               { desc = 'Rubocop lint command for current file', silent = true })

-- Simple Form
vim.keymap.set('n', '<leader><leader>rgSFi',  ':Generate simple_form:install<CR>',                { desc = 'Rails Generate Simple Form Install', silent = true  })

-- Stimulus/StimulusReflex
vim.keymap.set('n', '<leader><leader>rbaSR',  ':!bundle add stimulus_reflex<CR>',                 { desc = 'Add Stimulus Reflex to Project', silent = true })
vim.keymap.set('n', '<leader><leader>rSRi',   ':!rails stimulus_reflex:install<CR>',              { desc = 'Install StimulusReflex', silent = true  })
vim.keymap.set('n', '<leader><leader>rgSRI',  ':!rails generate stimulus_reflex:initializer<CR>', { desc = 'Create StimulusReflex Initializer', silent = true  })
vim.keymap.set('n', '<leader><leader>rgSt',   ':Generate stimulus<Space>',                        { desc = 'Rails Generate stimulus #{model}_controller', silent = true  })
vim.keymap.set('n', '<leader><leader>rgStmu', ':!rails stimulus:manifest:update',                 { desc = 'Rails update stimulus controllers', silent = true  })
vim.keymap.set('n', '<leader><leader>rDs',    ':Destroy stimulus<Space>',                         { desc = 'Rails Destroy Stimulus Controller Command', silent = true  })

-- ViewComponents
vim.keymap.set('n', '<leader><leader>rgv',  ':Generate component<Space>',                      { desc = 'Rails Generate View Component', silent = true  })

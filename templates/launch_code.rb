gem_group :development do
  gem 'hirb'
  gem 'annotate'
end

rails g annotate:install

# Opens Rails App in Browser after launch
inject_into_file 'config.ru', after: "run Rails.application\n" do <<-CODE
if Rails.env.development?
  Rails.application.config.after_initialize do
    port = begin
      Rails::Server::Options.new.parse!(ARGV)[:Port] || 3000
    rescue
      3000
    end
    `open http://localhost:\#{port}`
  end
end
CODE
end

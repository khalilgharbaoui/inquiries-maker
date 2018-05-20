Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  [user, password] == [ENV["SIDEKIQ_WEB_USER"], ENV["SIDEKIQ_WEB_PASSWORD"]]
end

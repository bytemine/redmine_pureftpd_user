require 'redmine'
require 'dispatcher'
require 'pureftpd_user_patch'

Dispatcher.to_prepare do
  User.send(:include, ::Plugin::Pureftpd::User)
end

Redmine::Plugin.register :redmine_pureftpd_user do
  name 'Redmine Pureftpd User plugin'
  author 'Bernd Ahlers'
  description 'This plugin maintains a table with pureftpd compatible users.'
  version '1.0'
end

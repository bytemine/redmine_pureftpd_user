require 'redmine'

Redmine::Plugin.register :redmine_pureftpd_user do
  name 'Redmine Pureftpd User plugin'
  author 'Bernd Ahlers'
  description 'This plugin maintains a table with pureftpd compatible users.'
  version '0.9'
end

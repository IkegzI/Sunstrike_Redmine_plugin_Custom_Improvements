require 'redmine'

Redmine::Plugin.register :sunstrike_redmine_plugin_custom_improvements do
  name 'Sunstrike Redmine Plugin Custom Improvements plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
  require_dependency 'improvements'


  default_settings = Additionals.load_settings
  settings(default: default_settings, partial: 'improvements/settings/improvements')



  menu :admin_menu, :sunstrike_redmine_plugin_custom_improvements, { controller: 'settings', action: 'plugin', id: 'improvements' }, caption: :label_improvements
end

require 'redmine'

Redmine::Plugin.register :sunstrike_redmine_plugin_custom_improvements do
  name 'Sunstrike Redmine Plugin Custom Improvements plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
  require_dependency 'improvements'


  # путь к странице
  # settings(default: default_settings, partial: 'improvements/settings/improvements')
  default_settings = Improvements.load_settings
  settings(default: default_settings, partial: 'improvements/settings/sunstrike_redmine_plugin_custom_improvements')

  object_to_prepare = Rails.configuration
  #patchs connection
  object_to_prepare.to_prepare do
    require_relative "./lib/patches/time_task_overrun/query_patch.rb"
    require_relative "./lib/patches/time_task_overrun/queries_helper_patch.rb"
    Query.send(:include, TimeTaskOverrun::Patches::QueryPatch)
    QueriesHelper.send(:include, TimeTaskOverrun::Patches::QueriesHelperPatch)
  end

  menu :admin_menu, :sunstrike_redmine_plugin_custom_improvements, { controller: 'settings', action: 'plugin', id: 'sunstrike_redmine_plugin_custom_improvements' }, caption: :label_improvements
end

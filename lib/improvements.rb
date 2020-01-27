module Improvements

  require_dependency 'improvements/hooks'

  class << self
    def load_settings(plugin_id = 'sunstrike_redmine_plugin_custom_improvements')
      cached_settings_name = '@load_settings_' + plugin_id
      cached_settings = instance_variable_get(cached_settings_name)
      if cached_settings.nil?
        data = YAML.safe_load(ERB.new(IO.read(Rails.root.join('plugins',
                                                              plugin_id,
                                                              'config',
                                                              'settings.yml'))).result) || {}
        instance_variable_set(cached_settings_name, data.symbolize_keys)
      else
        cached_settings
      end
    end
  end
end

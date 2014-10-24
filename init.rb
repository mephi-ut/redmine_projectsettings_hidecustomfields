require 'redmine'

require_dependency "redmine_projectsettings_hidecustomfields/patches/app/controllers/projects_controller"
	
Redmine::Plugin.register :redmine_projectsettings_hidecustomfields do
	name 'Hide custom fields from project settings'
	author 'Dmitry Yu Okunev'
	author_url 'https://github.com/xaionaro/'
	description 'Removes ability to setup custom fields in project settings on rule based permissions'
	url 'https://github.com/mephi-ut/redmine_projectsettings_hidecustomfields'
	version '0.0.1'

	project_module :redmine_projectsettings_hidecustomfields do
		permission :manage_custom_fields, {}
	end
end

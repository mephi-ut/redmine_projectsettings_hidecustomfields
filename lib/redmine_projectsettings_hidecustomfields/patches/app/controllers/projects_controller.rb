
module ProjectSettingsHideCustomFields
	module ProjectsControllerPatch
		def self.included(base)
			base.extend(ClassMethods)
			base.send(:include, InstanceMethods)

			base.class_eval do
				alias_method_chain :settings, :projectsettings_hidecustomfields
				alias_method_chain :new,      :projectsettings_hidecustomfields
			end
		end

		module ClassMethods
		end

		module InstanceMethods
			def settings_with_projectsettings_hidecustomfields
				settings_without_projectsettings_hidecustomfields
				@issue_custom_fields = [] if !User.current.allowed_to?(:manage_custom_fields, @project) && !User.current.admin?
			end
			def new_with_projectsettings_hidecustomfields
				new_without_projectsettings_hidecustomfields
				@issue_custom_fields = [] unless User.current.admin?
			end
		end
	end
end

ProjectsController.send(:include, ProjectSettingsHideCustomFields::ProjectsControllerPatch)


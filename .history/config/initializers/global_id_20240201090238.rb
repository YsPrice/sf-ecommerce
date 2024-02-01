Rails.application.reloader.to_prepare do
    GlobalId::ActiveRecord::InstanceMethods.module_eval do
      def save(**)
        result = GlobalId.with_locale(translation.locale || I18n.default_locale) do
          without_fallbacks do
            super
          end
        end
  
        globalId.clear_dirty if result
  
        result
      end
    end
  end
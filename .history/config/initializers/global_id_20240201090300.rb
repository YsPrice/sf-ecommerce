Rails.application.reloader.to_prepare do
    GlobalID::ActiveRecord::InstanceMethods.module_eval do
      def save(**)
        result = GlobalID.with_locale(translation.locale || I18n.default_locale) do
          without_fallbacks do
            super
          end
        end
  
        globalID.clear_dirty if result
  
        result
      end
    end
  end
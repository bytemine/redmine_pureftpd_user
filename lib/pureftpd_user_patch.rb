module Plugin
  module Pureftpd
    module User
      def self.included(base)
        base.send(:include, InstanceMethods)
        base.class_eval do
          has_one :pureftpd_user, :dependent => :destroy
          before_save :update_pureftpd_user
        end
      end

      module InstanceMethods
        private
          def update_pureftpd_user
            PureftpdUser.update_user(self) if self.password
          end
      end
    end
  end
end

#Zendesk - Gitrob User Model
module Gitrob
  module Models
    class GitrobUser < Sequel::Model
      plugin :secure_password, include_validations: false
      set_allowed_columns :username, :password_digest

      def validate
        super
        validates_presence [:username, :password_digest]
      end

      # def authenticate(attempted_password)
      #   if self.password_digest == attempted_password
      #     true
      #   else
      #     false
      #   end
      # end

      if GitrobUser.count == 0
        @user = GitrobUser.new
        @user.username = "admin"
        @user.password = "admin"
        @user.save
      end

    end
  end
end

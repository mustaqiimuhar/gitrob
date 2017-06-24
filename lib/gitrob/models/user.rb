#Zendesk - FalsePositive Model
module Gitrob
  module Models
    class User < Sequel::Model
      plugin :secure_password, cost: 6
      set_allowed_columns :username, :password_digest

      def validate
        super
        validates_unique(:fingerprint, :path, :repository)
        validates_presence [:fingerprint, :path, :repository]
        validates_format SHA_REGEX, :fingerprint
      end
    end
  end
end

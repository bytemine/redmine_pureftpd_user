class PureftpdUser < ActiveRecord::Base
  def self.update_user(user)
    puser = self.find_by_user(user.login) || self.new(:user => user.login)
    puser.password = encrypt_password(user.password)
    puser.save
  end

  private
    def self.encrypt_password(password)
      password.crypt(create_salt)
    end

    def self.create_salt
      chars = ['.', '/', '0'..'9', 'A'..'Z', 'a'..'z'].collect do |char|
        char.to_a
      end
      chars = chars.flatten

      salt = ""
      2.times do
        salt << chars[rand(chars.length)]
      end
      salt
    end
end

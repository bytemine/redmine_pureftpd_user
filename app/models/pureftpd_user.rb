class PureftpdUser < ActiveRecord::Base
  belongs_to :user

  def self.update_user(user)
    puser = user.pureftpd_user || user.build_pureftpd_user(:username => user.login)
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

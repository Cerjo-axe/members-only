class User < ApplicationRecord
    attr_accessor :password
    validates :username, presence:true, uniqueness:true, length:{minimum: 5 }
    validates :email, presence:true, uniqueness:true, length:{minimum: 10 }
    validates :password, presence:true, length:{in: 8..20 }, on: :create

    before_validation(on: :create) :encrypt

    private
    def encrypt
        self.crypt= BCrypt::Engine.generate_salt
        self.h_password=BCrypt::Engine.hash_secret(password,crypt)
    end
end

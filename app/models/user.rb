class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
   devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
   has_many :books
   attr_accessor :remember_token, :activation_token, :reset_token
   
   def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
   end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
end

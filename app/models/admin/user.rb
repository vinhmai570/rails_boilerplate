# == Schema Information
#
# Table name: admin_users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_admin_users_on_email  (email) UNIQUE
#
class Admin::User < Admin::ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, allow_nil: true, length: { minimum: 12 }, format: { with: /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])/ }

  before_validation do
    self.email = email.try(:downcase).try(:strip)
  end
end

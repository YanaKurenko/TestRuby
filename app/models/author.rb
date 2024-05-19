class Author < ApplicationRecord

    # include Visible
    has_many :articles, dependent: :destroy
    
    VALID_NAME_REGEX = /\A[^0-9!@#\$%\^&*+_=]+\z/

    validates :fname, :lname, presence: true, 
              format: { with: VALID_NAME_REGEX, message: "only allows letters and '-' symbol" }
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
end

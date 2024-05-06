class Author < ApplicationRecord

    # include Visible
    has_many :articles, dependent: :destroy
    
    validates :fname, presence: true
    validates :lname, presence: true, length: { minimum: 1 }
    validates :email, presence: true, uniqueness: true
end

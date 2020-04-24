class Memo < ApplicationRecord
    belongs_to :user
 
        validates :content,presence: true 
        validates :category_id,presence: true 
    
    validates :title, presence: true, length: {maximum:50}
    
end

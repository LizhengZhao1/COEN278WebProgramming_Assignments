class Product < ApplicationRecord
    
    validates(:name, :description, :image, presence: true)
    validates(:price, numericality: {greater_than_or_equal_to: 0.01})
    validates(:name, uniqueness: true) 
    validates(:image, allow_blank: true, format: {with: %r{\.(gif|jpg|jpeg|png)\Z}i, message: 'must be GIF, JPG, JPEG, PNG images'} )

    has_many (:lineitems)
    before_destroy :make_sure_this_product_is_not_lineitems  

    def make_sure_this_product_is_not_lineitems
        if self.lineitems.empty?
          return true
        else
          errors.add(:base, 'Line Items present')
          return false
        end
      end
end

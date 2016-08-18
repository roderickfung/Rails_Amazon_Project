require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'title must be present' do
      #GIVEN:
      prod = Product.new
      #WHEN:
      prod.valid?
      #THEN:
      expect(prod.errors).to have_key(:title)
    end

    it 'price must be present' do
      prod = Product.new
      prod.valid?
      expect(prod.price.nil? == false)
    end

    it 'description must be present' do
      prod = Product.new
      prod.valid?
      expect(prod.errors).to have_key(:description)
    end
    #
    it 'title must be unique' do
      Product.create title:'valid_title',description:'description',price:'100'
      prod = Product.new title:'valid_title'
      prod.valid?
      expect(prod.errors).to have_key(:title)
    end
    #
    it 'price must be more than 0' do
      prod = Product.new title:'price_title', description:'price_desc', price: 0
      prod.valid?
      expect(prod.errors).to have_key(:price)
    end

  end

  describe 'Search' do
    it 'search name or description' do
      Product.create title:'test_case', description:'include test_case hello'
      srch = Product.search('test_case')
    end
  end
end

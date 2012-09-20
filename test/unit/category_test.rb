require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
   test "name" do
     category_test = Category.new
     category_test.name = 'Inbox'
     category_test.to_do << To_Do.new
     category_test.to_do.first.text = "Shopping"
     assert category_text.title == 'Inbox (1)'
   end
end
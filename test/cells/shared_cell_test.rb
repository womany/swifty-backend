require 'test_helper'

class SharedCellTest < Cell::TestCase
  test "navbar" do
    invoke :navbar
    assert_select "p"
  end
  

end

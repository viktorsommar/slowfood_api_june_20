require 'rails_helper'

RSpec.describe Product, type: :model do

  it 'should have a valid Factory' do
    expect(create(:product)).to be_valid
  end
  

  describe 'Database table' do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :price }
  end
end

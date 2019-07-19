require 'rails_helper'

RSpec.describe Member do
  it 'has attributes' do
    member = Member.new(1, 'test')

    expect(member.id).to eq(1)
    expect(member.name).to eq('test')
  end
end

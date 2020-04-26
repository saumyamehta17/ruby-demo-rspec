require 'spec_helper'

RSpec.describe 'How to suppress the cache' do

  subject {
    person = double(name: person_name)
    person.extend(Person)
  }
  names = %w[Saumya Aleks Peter]

  # context 'cached with let variable' do

  #   names.each do |name|
  #     let(:person_name) { name }

  #     # person_name Saumya
  #     # person_name Aleks
  #     # person_name Peter
  #     it 'should have correct text in quality' do
  #       expect(subject.quality).to eq("#{name} is a very good programmer.")
  #     end
  #   end
  # end

  context 'suppress cached value' do
    let(:person_name) { 'default_value' }

    names.each do |name|
      it 'should have correct text in quality' do
        subject.stub(name: name)
        expect(subject.quality).to eq("#{name} is a very good programmer.")
      end
    end
  end
end

module Person

  def quality
    "#{name} is a very good programmer."
  end
end
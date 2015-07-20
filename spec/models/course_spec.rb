RSpec.describe Course, type: :model do
  let(:course) { FactoryGirl.build_stubbed :course }

  describe '#to_s' do
    it 'returns a string describing itself in the standard format' do
      expect(course.to_s).to eq "#{course.section}#{course.number} #{course.name}"
    end
  end
end

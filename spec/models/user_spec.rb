RSpec.describe User, type: :model do

  let(:user) { FactoryGirl.build_stubbed :user }
  let(:instructor) { FactoryGirl.build_stubbed :user, :instructor }
  let(:admin) { FactoryGirl.build_stubbed :user, :admin }

  describe '#to s' do
    it 'returns the users name' do
      expect(user.to_s).to eq 'Test User'
    end
  end

  describe  '#signed_up_for' do
    it 'returns a list of classes the user is signed up for' do
      offering = FactoryGirl.create :offering
      ClassSignup.create(offering: offering, user: user)
      expect(user.signed_up_for).to eq [offering]
    end

    it 'returns an empty list if the user is not signed up for any classes' do
      expect(user.signed_up_for).to be_empty
    end
  end

  describe '#signed_up_for?' do
    it 'returns false if a user is not signed up for a class' do
      offering = FactoryGirl.create :offering
      expect(user.signed_up_for? offering).to be_falsey
    end

    it 'returns true if a user is signed up for a class' do
      offering = FactoryGirl.create :offering
      ClassSignup.create(offering: offering, user: user)
      expect(user.signed_up_for? offering).to be_truthy
    end
  end

  describe '#sign_up_for' do
    pending
  end

  describe '#drop_offering' do
    pending
  end

  describe '#is_admin?' do
    it 'returns true if admin flag is true' do
      expect(admin.is_admin?).to be_truthy
    end

    it 'returns false if admin flag is not true' do
      expect(user.is_admin?).to be_falsey
    end
  end

  describe '#is_instructor?' do
    it 'returns true if instructor flag is true' do
      expect(instructor.is_instructor?).to be_truthy
    end

    it 'returns false if instructor flag is false' do
      expect(user.is_instructor?).to be_falsey
    end
  end

  describe '.from_omniauth' do
    pending
  end

  describe '.instructors' do
    pending
  end
end

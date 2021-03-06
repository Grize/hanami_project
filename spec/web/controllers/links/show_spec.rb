RSpec.describe Web::Controllers::Links::Show, type: :action do
  let(:action) { described_class.new(repo: link_repo) }
  let(:params) { Hash[] }
  let(:link_repo) {double(:link_repo, find_by_key: entity)}
  #let(:operation) { ->(_) { entity } }

  context 'when link exist' do 
    let(:entity) { Link.new(url: 'google.com') }

    it { expect(action.call(params)).to redirect_to('google.com') }
  end

  context 'when link does not exist' do
    let(:entity) { nil }

    it 'returns error message' do
      response = action.call(params)
      expect(response[2]).to eq ['Not found']
    end
  end

  context 'when action calls real repository' do
    let(:action) { described_class.new }
    let(:params) { Hash[id: link.key] }
    let(:link) { link_repo.create(key: '123', url: 'google.com') }
    let(:link_repo) { LinkRepository.new }

    after { link_repo.clear }

    it { expect(action.call(params)).to redirect_to('google.com') }
  end
  
end

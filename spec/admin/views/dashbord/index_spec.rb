RSpec.describe Admin::Views::Dashbord::Index, type: :view do
  let(:exposures) { Hash[format: :html, links: []] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/dashbord/index.html.slim') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    expect(view.format).to eq exposures.fetch(:format)
  end

  it 'exposes #links' do
    expect(view.links).to eq []
  end
end

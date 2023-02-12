class Tea
  attr_accessor :flavor, :temperature
  def initialize(input)
    @flavor = input[:flavor]
    @temperature = input[:temperature]
  end
end

RSpec.configure do |config|
  config.example_status_persistence_file_path = 'spec/examples.txt'
end

RSpec.describe Tea do
  let(:tea) { Tea.new(flavor: 'earl grey', temperature: 250) }

  it 'tastes like Earl Grey' do
      expect(tea.flavor).to eq('earl grey')
  end

  it 'is hot' do
    expect(tea.temperature).to be > 200.0
  end
end


Sandwich = Struct.new(:taste, :toppings)

0. Repetitions.
RSpec.describe 'An ideal sandwich' do
  it 'is delicious' do
    sandwich = Sandwich.new('delicious', [])
    taste = sandwich.taste
    expect(taste).to eq('delicious')
  end

  it 'lets me add toppings' do
    sandwich = Sandwich.new('delicious', [])
    sandwich.toppings << 'cheese' 
    toppings = sandwich.toppings
    expect(toppings).not_to be_empty
  end
end

# 1. With hook.
RSpec.describe 'An ideal sandwich' do
  before { @sandwich = Sandwich.new('delicious', []) }
  
  it 'is delicious' do
    # sandwich = Sandwich.new('delicious', [])
    taste = @sandwich.taste
    expect(taste).to eq('delicious')
  end

  it 'lets me add toppings' do
    # sandwich = Sandwich.new('delicious', [])
    @sandwich.toppings << 'cheese' 
    toppings = @sandwich.toppings
    expect(toppings).not_to be_empty
  end
end

2. With helper method.
RSpec.describe 'An ideal sandwich' do
  def sandwich 
    @sandwich ||= Sandwich.new('delicious', [])
  end

  it 'is delicious' do
    sandwich = Sandwich.new('delicious', [])
    taste = sandwich.taste
    expect(taste).to eq('delicious')
  end

  it 'lets me add toppings' do
    sandwich = Sandwich.new('delicious', [])
    sandwich.toppings << 'cheese' 
    toppings = sandwich.toppings
    expect(toppings).not_to be_empty
  end
end

# 3. With let.
RSpec.describe 'An ideal sandwich' do
  let(:sandwich) { Sandwich.new('delicious', []) }

  it 'is delicious' do
    sandwich = Sandwich.new('delicious', [])
    taste = sandwich.taste
    expect(taste).to eq('delicious')
  end

  it 'lets me add toppings' do
    sandwich = Sandwich.new('delicious', [])
    sandwich.toppings << 'cheese' 
    toppings = sandwich.toppings
    expect(toppings).not_to be_empty
  end
end

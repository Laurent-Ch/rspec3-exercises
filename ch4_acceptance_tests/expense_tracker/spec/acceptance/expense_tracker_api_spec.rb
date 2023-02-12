frequire 'rack/test'
require 'json'
require_relative '../../app/api'

module ExpenseTracker
  RSpec.describe 'Expense Tracker API' do
    include Rack::Test::Methods

    # Looks like instantiation
    def app
      ExpenseTracker::API.new
    end

    it 'records submitted expenses' do
      pending 'Need to persist expenses'
      
      # This is the function that processes expenses
      def post_expense(expense)
        # POST request, '.../expenses' URL, JSON expense object as a body
        post '/expenses', JSON.generate(expense)
        
        # Check that we get a success response from the API
        expect(last_response.status).to eq(200)
        
        # Put the reponse body in a variable
        parsed = JSON.parse(last_response.body)
        
        # Check that the response body isn't empty / contains what we want
        expect(parsed).to include('expense_id' => a_kind_of(Integer))
        
        # We give an id to the expense object based on the it sent back by the server to the client in the response body
        expense.merge('id' => parsed['expense_id'])
      end

      # Create expenses
      coffee = post_expense(
        'payee' => 'Starbucks',
        'amount' => 5.75,
        'date' => '2017-06-10'
      )

      zoo = post_expense(
        'payee' => 'Zoo',
        'amount' => 15.25,
        'date' => '2017-06-10'
      )

      groceries = post_expense(
        'payee' => 'Whole Foods',
        'amount' => 95.20,
        'date' => '2017-06-11'
      )

      # Check that it all works as intended
      get '/expenses/2017-06-10'
      expect(last_response.status).to eq(200)
      expenses = JSON.parse(last_response.body)
      expect(expenses).to contain_exactly(coffee, zoo)
    end
  end
end

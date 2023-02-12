require 'sinatra/base'
require 'json'

module ExpenseTracker
  class API < Sinatra::Base
    # If the following request is made
    post '/expenses' do 

      # Generate this canned response body
      JSON.generate('expense_id' => 42)
    end

    get '/expenses/:date' do
      JSON.generate([])
    end
  end
end

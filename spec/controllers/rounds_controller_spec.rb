require 'spec_helper'

describe RoundsController do

  describe "GET 'report'" do
    it "returns http success" do
      get 'report'
      response.should be_success
    end
  end

end

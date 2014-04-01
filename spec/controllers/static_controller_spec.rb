require 'spec_helper'

describe StaticController do
  describe "#home" do
    it "returns http success" do
      get :home

      expect(response).to be_success
    end
  end
end

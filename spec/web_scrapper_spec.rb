require_relative '../lib/web_scrapper'

describe "Tests for our web_scrapper program" do

  describe "Crypto_scrapper" do
    it "Tests if the output is a non-nil hash" do
      expect(crypto_scrapper).to be_a_kind_of(Array)
      expect(crypto_scrapper).not_to be_empty
    end
  end

end

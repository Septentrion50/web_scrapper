require_relative '../lib/web_scrapper'

describe "Tests for our web_scrapper program" do

  describe "Crypto_scrapper" do
    it "Tests if the output is a non-nil array of hashes" do
      expect(crypto_scrapper).not_to be_nil
      expect(crypto_scrapper).to be_a_kind_of(Array)
      expect(crypto_scrapper).not_to be_empty
      test_array = crypto_scrapper
      expect(test_array[0]).to be_a_kind_of(Hash) 
      expect(test_array[0].has_key?("Bitcoin")).to eq(true)
      expect(test_array.size).to be_between(180, 220) 
    end
  end

  describe "Mairie christmas" do
    it "Checks if the mairie_christmas output is a non-nil array of hashes" do
      expect(mairie_christmas).not_to be_nil
      expect(mairie_christmas).to be_a_kind_of(Array)
      expect(mairie_christmas).not_to be_empty
      test_array = mairie_christmas 
      expect(test_array[0]).to be_a_kind_of(Hash) 
      expect(test_array[0].has_key?("ableiges")).to eq(true)
      expect(test_array.size).to eq(165)
    end
  end
end

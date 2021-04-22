require_relative '../lib/web_scrapper'

describe "Tests for our web_scrapper program" do

  describe "Crypto_scrapper" do
    it "Tests if the output is a non-nil array of hashes" do
      test_array = crypto_scrapper
      expect(test_array).not_to be_nil
      expect(test_array).to be_a_kind_of(Array)
      expect(test_array).not_to be_empty
      expect(test_array[0]).to be_a_kind_of(Hash) 
      expect(test_array[0].has_key?("Bitcoin")).to eq(true)
      expect(test_array.size).to be_between(180, 220) 
    end
  end

  describe "Mairie christmas" do
    it "Checks if the mairie_christmas output is a non-nil array of hashes" do
      test_array = mairie_christmas 
      expect(test_array).not_to be_nil
      expect(test_array).to be_a_kind_of(Array)
      expect(test_array).not_to be_empty
      expect(test_array[0]).to be_a_kind_of(Hash) 
      expect(test_array[0].has_key?("ableiges")).to eq(true)
      expect(test_array.size).to eq(165)
    end
  end

  describe "Chers députés" do
    it "Checks if the expected output for our method chers_deputes works" do
      test_array = chers_deputes
      expect(test_array).not_to be_nil
      expect(test_array).to be_a_kind_of(Array)
      expect(test_array).not_to be_empty
      expect(test_array[0]).to be_a_kind_of(Hash) 
      expect(test_array[0].has_key?("first_name")).to eq(true)
      expect(test_array[0].has_key?("last_name")).to eq(true)
      expect(test_array[0].has_key?("email")).to eq(true)
      expect(test_array.size).to eq(573)
    end
  end

end

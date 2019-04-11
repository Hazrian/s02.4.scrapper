require_relative '../lib/scrapping_depute'


describe "the crypto_scrapper function" do
  test = get_depute_email_array
  it "return an Hash" do
    expect(test.class).to eq(Array)
  end
   it "return at least 500 deputies" do
    expect(test.length > 500).to eq(true)
  end
  it "should return valid emails for Mme Caroline Abadie" do
    expect(test.select{
      |d|
      d[:first_name] == "Caroline"
	  d[:last_name] == "Abadie"
    }[0][:email]).to eq("caroline.abadie@assemblee-nationale.fr")
  end
end


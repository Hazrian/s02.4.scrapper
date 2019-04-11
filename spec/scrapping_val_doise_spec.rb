require_relative '../lib/scrapping_val_doise'


describe "the get townhall email array function" do
  test = get_townhall_email_array
  it "return an Hash" do
    expect(test.class).to eq(Hash)
  end
   it "return at least 100 cities" do
    expect(test.length > 100).to eq(true)
  end
  it "verify that BEAUCHAMP exist" do
    expect(test.select {|k , v| k.match("BEAUCHAMP")}).to eq({"BEAUCHAMP"=>"accueil-mairie@ville-beauchamp.fr"})
  end
  it "return good email" do
	expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/attainville.html")).to eq ("mairie@attainville.fr")
  end
end

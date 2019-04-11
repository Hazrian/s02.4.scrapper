require_relative '../lib/scrapping_crypto'


describe "scrapping function" do
  test = scrapping_crypto("https://coinmarketcap.com/all/views/all/")
  it "return an Hash" do
    expect(test.class).to eq(Hash)
  end
  it "scrapping Cryptocurrencies" do
    expect(test["BTC"]!=nil).to eq(true)									#le BTC doit etre present dans le hash final et doit donc retourner true si on le compare a l'inverse de nil 
  end
  it "return at least 1000 currency" do
    expect(test.length > 1000).to eq(true)
  end

end


require_relative '../lib/scrapping_crypto'


describe "scrapping function" do
  it "scrapping Cryptocurrencies" do
    test = scrapping_crypto("https://coinmarketcap.com/all/views/all/")
    expect(test["BTC"]!=nil).to eq(true)
  end

end

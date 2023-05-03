import Foundation

protocol CoinManagerDelegate {
    func didUpdateCurrency(_ coinManager: CoinManager, coinData: CoinModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    let apiKey = "A8AA8B19-F1DA-48E0-82D5-6969F6B9A99F"
    let url = "https://rest.coinapi.io/v1/exchangerate/ETH"
    
    var delegate: CoinManagerDelegate?
    
    func getCoinPrice(currency: String) {
        let urlString = "\(url)/\(currency)?apikey=\(apiKey)"
        // 1. Create a url
        if let url = URL(string: urlString) {
            // 2. Create a session
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let coinPrice = self.parseJSON(safeData) {
                        self.delegate?.didUpdateCurrency(self, coinData: coinPrice)
                    }
                }
            }
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let coinName = decodedData.asset_id_base
            let currency = decodedData.asset_id_quote
            let price = decodedData.rate
        
            let coin = CoinModel(asset_id_base: coinName, asset_id_quote: currency, rate: price)
            return coin
        } catch {
            print(error)
            return nil
        }
    }
}

import UIKit
import CLTypingLabel

class CryptoVC: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var coinPrice: CLTypingLabel!
    @IBOutlet weak var pickerView: UIPickerView!

    // MARK: - Objects
    var coinManager = CoinManager()
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinPrice.charInterval = 0.1
        pickerView.delegate = self
        pickerView.dataSource = self
        coinManager.delegate = self
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
// MARK: - Extensions
extension CryptoVC: CoinManagerDelegate {
    func didUpdateCurrency(_ coinManager: CoinManager, coinData: CoinModel) {
        DispatchQueue.main.async {
            switch coinData.asset_id_quote {
            case K.currencyArray[0]:
                self.coinName.text = coinData.asset_id_base
                self.coinPrice.text = "\(coinData.rateString)€"
            case K.currencyArray[1]:
                self.coinName.text = coinData.asset_id_base
                self.coinPrice.text = "\(coinData.rateString) Zł"
            case K.currencyArray[2]:
                self.coinName.text = coinData.asset_id_base
                self.coinPrice.text = "$\(coinData.rateString)"
            default:
                self.coinName.text = coinData.asset_id_base
                self.coinPrice.text = "\(coinData.rateString)₴"
            }
        }
    }
    func didFailWithError(error: Error) {
        print(error)
    }
}
extension CryptoVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return K.currencyArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return K.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = K.currencyArray[row]
        coinManager.getCoinPrice(currency: selectedCurrency)
    }
}

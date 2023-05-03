import UIKit
import CoreLocation
import CLTypingLabel

class WeatherVC: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var getLocationLabel: UILabel!
    
    // MARK: - Object
    
    var weatherManager = WeatherManager()
    var locationManager = CLLocationManager()
    var audioModel = AudioModel()
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        searchTextField.delegate = self
        weatherManager.delegate = self
        
        K.fillTextField(textField: searchTextField, content: "Enter the city name")
    }
    // MARK: - IBAction
    
    @IBAction func getLocationButtonPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

    // MARK: - Extension

extension WeatherVC: UITextFieldDelegate {
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        audioModel.playButtonPressedSound(soundName: "buttonPressed")
        searchTextField.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchData(cityName: city)
        }
        searchTextField.text = ""
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            searchTextField.placeholder = "Type something"
            return false
        }
    }
}
extension WeatherVC: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.cityNameLabel.text = weather.cityName
            self.temperatureLabel.text = "\(weather.tempString)°C"
            self.windLabel.text = "\(weather.windString) m/s"
            self.pressureLabel.text = "\(weather.pressureString) Pa"
        }
    }
    func didFailWithError(err: Error) {
        print(err)
    }
}
extension WeatherVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchData(lat, lon)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

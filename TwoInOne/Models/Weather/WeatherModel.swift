import Foundation

struct WeatherModel {
    let cityName: String
    let temperature: Double
    let windSpeed: Double
    let press: Double
    
    var tempString: String {
        return String(format: "%.1f", temperature)
    }
    var windString: String {
        return String(format: "%.2f", windSpeed)
    }
    var pressureString: String {
        return String(format: "%.0f", press)
    }
    
}

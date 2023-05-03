import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let wind: Wind
}

struct Main: Decodable {
    let temp: Double
    let pressure: Double
}

struct Wind: Decodable {
    let speed: Double
}

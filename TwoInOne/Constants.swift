import Foundation
import UIKit

struct K {
    static let currencyArray = ["EUR", "PLN", "USD", "UAH"]
    static let locationDescription = "Get the weather in a current location"
    
    static func fillTextField(textField: UITextField, content: String) {
        textField.attributedPlaceholder = NSAttributedString(string: content, attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.2951935017)])
    }
}

import UIKit
class DataTextField: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.masksToBounds = true
        layer.cornerRadius = 15
        layer.shadowOpacity = 0.5
    }
}

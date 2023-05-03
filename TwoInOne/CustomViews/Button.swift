import UIKit
class Button: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.4
    }
}

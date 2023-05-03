import UIKit
class Label: UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.masksToBounds = true
        layer.cornerRadius = 12
        layer.shadowOpacity = 0.5
    }
}

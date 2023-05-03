import UIKit

class View: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 15
        layer.shadowOpacity = 0.4
    }
}

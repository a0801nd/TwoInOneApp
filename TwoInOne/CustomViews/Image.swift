import UIKit

class Image: UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 15
        layer.shadowOpacity = 0.3
    }
}

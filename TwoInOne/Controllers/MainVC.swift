import UIKit
class MainVC: UIViewController {
    
    @IBOutlet weak var cryptoLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction func weatherButtonPressed(_ sender: UIButton) {}
    @IBAction func cryptoButtonPressed(_ sender: UIButton) {}
    @IBAction func accountButtonPressed(_ sender: UIButton) {}
}

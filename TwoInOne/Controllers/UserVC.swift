import UIKit

class UserVC: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func mainPageButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

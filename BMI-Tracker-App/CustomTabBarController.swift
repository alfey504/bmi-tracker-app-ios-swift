import UIKit

class CustomTabBarController: UITabBarController {
    
    @IBInspectable var initailIndex: Int = 0
    
    var comingFromEditScreen: Bool? = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .clear
        selectedIndex = initailIndex
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if(comingFromEditScreen == true){
            self.selectedIndex = 1
        }
    }

    
}

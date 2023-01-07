//
// Created on 2023/1/7.
//

import UIKit

class PayAPI {
    class func payMoney(completion: @escaping () -> ()) {
        completion()
    }
}

class DetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pay()
    }
    
    var retryCount = 10
    
    func pay() {
        PayAPI.payMoney { [weak self] in
            guard let self = self else { return }
            if self.retryCount > 0 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    print("count down \(self.retryCount)")
                    self.retryCount -= 1
                    self.pay()
                }
            } else {
                print("I paid the bill")
            }
        }
    }
    
    deinit {
        print("I left.")
    }
}


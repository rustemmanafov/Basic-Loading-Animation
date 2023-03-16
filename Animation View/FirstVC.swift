//
//  FirstVC.swift
//  Animation View
//
//  Created by Rustem Manafov on 13.03.23.
//

import UIKit

class FirstVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        perform(#selector(presentVC), with: nil, afterDelay: 2)
        
        perform(#selector(hide), with: nil, afterDelay: 5)
    }
    
    @objc func presentVC() {
        if let destinationVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "SecondVC") as? SecondVC {
            destinationVC.completion = { [weak self] in
                if self == self {
                    print("hello")
                }
                
            }
            
            DispatchQueue.main.async { [weak self] in
                if let strongSelf = self {
                    strongSelf.present(destinationVC, animated: false)
                }
            }
        }
    }
    
    @objc func hide() {
        if let blurVC = self.presentedViewController as? SecondVC {
            blurVC.end()
        }
    }

}

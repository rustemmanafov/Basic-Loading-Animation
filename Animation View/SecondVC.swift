//
//  SecondVC.swift
//  Animation View
//
//  Created by Rustem Manafov on 13.03.23.
//

import UIKit

class SecondVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var shouldAnimate: Bool = true
    var step: CGFloat = .pi / 2
    var goal: CGFloat = 0
    
    var completion: (() -> ())!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.alpha = 0
        
        self.imageView.image = self.imageView.image?.withRenderingMode(.alwaysTemplate)
        self.imageView.tintColor = UIColor.blue
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fadeIn()
    }
    
    private func fadeIn() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear) {
            
            self.view.alpha = 1
        }
        self.rotate()
    }
    
    private func rotate() {
        goal = goal + step
        UIView.animate(withDuration: 1/4, delay: 0, options: .curveLinear) {
            
            self.imageView.transform = CGAffineTransform(rotationAngle: self.goal)
        } completion: { _ in
            if self.shouldAnimate {
                self.rotate()
            }
        }
    }
    
    func end() {
        fadeOut()
    }
    
    private func fadeOut() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear) {
            self.view.alpha = 0
        } completion: { _ in
            self.dismiss(animated: false) {
                self.completion?()
            }

        }
    }
    
    
}


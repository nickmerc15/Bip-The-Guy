//
//  ViewController.swift
//  Bip The Guy
//
//  Created by Nicholas Mercadante on 2/18/20.
//  Copyright © 2020 Nicholas Mercadante. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageToPunch: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func animateImage() {
        let bounds = self.imageToPunch.bounds
        let shrinkValue : CGFloat = 60
        
        self.imageToPunch.bounds = CGRect(x: self.imageToPunch.bounds.origin.x + shrinkValue , y: self.imageToPunch.bounds.origin.y - shrinkValue , width: self.imageToPunch.bounds.size.width - shrinkValue, height: self.imageToPunch.bounds.size.height - shrinkValue)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 10, options: [], animations: { self.imageToPunch.bounds = bounds }, completion: nil)
    }

    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func cameraPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        animateImage()
    }
}


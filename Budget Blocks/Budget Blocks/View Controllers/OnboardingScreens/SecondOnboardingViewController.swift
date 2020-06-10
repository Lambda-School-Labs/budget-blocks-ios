//
//  SecondOnboardingViewController.swift
//  Budget Blocks
//
//  Created by Nick Nguyen on 6/9/20.
//  Copyright © 2020 Isaac Lyons. All rights reserved.
//

import UIKit

class SecondOnboardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let leftRecognizer = UISwipeGestureRecognizer(target: self, action:
            #selector(swipeMade(_:)))
        leftRecognizer.direction = .left
        
        let rightRecognizer = UISwipeGestureRecognizer(target: self, action:
            #selector(swipeMade(_:)))
        rightRecognizer.direction = .right
        self.view.addGestureRecognizer(leftRecognizer)
        self.view.addGestureRecognizer(rightRecognizer)
        
        
        navigationItem.hidesBackButton = true
        
    }
    

   
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @objc func swipeMade(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .right  {
            
            navigationController?.popViewController(animated: true)
        }
        if sender.direction == .left {
            performSegue(withIdentifier: "2To3", sender: self)
            
        }
    }
}
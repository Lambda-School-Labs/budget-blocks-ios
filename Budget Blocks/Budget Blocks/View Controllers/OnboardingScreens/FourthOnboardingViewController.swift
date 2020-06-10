//
//  FourthOnboardingViewController.swift
//  Budget Blocks
//
//  Created by Nick Nguyen on 6/9/20.
//  Copyright © 2020 Isaac Lyons. All rights reserved.
//

import UIKit
import LinkKit
import LinkPresentation

class FourthOnboardingViewController: UIViewController, PLKPlaidLinkViewDelegate {
    func linkViewController(_ linkViewController: PLKPlaidLinkViewController, didSucceedWithPublicToken publicToken: String, metadata: [String : Any]?) {
        print("Hello")
        dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "LinkToDashboard", sender: self)
    }
    
    func linkViewController(_ linkViewController: PLKPlaidLinkViewController, didExitWithError error: Error?, metadata: [String : Any]?) {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
    

    @IBAction func linkAccountTapped(_ sender: UIButton) {
                guard let publicKey       = ProcessInfo.processInfo.environment["PLAID_PUBLIC_KEY"] else { return NSLog("No public key found!") }
                let linkConfiguration     = PLKConfiguration(key: publicKey, env: .sandbox, product: [.auth, .transactions, .identity])
                linkConfiguration.webhook = URL(string: "https://lambda-budget-blocks.herokuapp.com/plaid/webhook")!
                let linkViewController    = PLKPlaidLinkViewController(configuration: linkConfiguration, delegate: self)
                present(linkViewController, animated: true)
    }
    
}
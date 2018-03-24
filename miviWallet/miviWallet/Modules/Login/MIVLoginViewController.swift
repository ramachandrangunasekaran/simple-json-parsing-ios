//
//  MIVLoginViewController.swift
//  miviWallet
//
//  Created by R@M on 24/03/18.
//  Copyright © 2018 ramachandran. All rights reserved.
//

import UIKit

class MIVLoginViewController: UIViewController,JsonParserDelegate {
    
    func didCompletedParsing() {
        DispatchQueue.main.async(execute: {
            self.progressHUD.removeFromSuperview()
            self.nextButton.isEnabled = true
            self.emailField.isEnabled = true
        })
    }
    
    func didErrorOnParsing(error: String) {
        self.throwValidation(withTitle: "Parsing Error", andMessage: "Something went wrong while parsing the json file : \(error)")
        self.nextButton.isEnabled = false
        self.emailField.isEnabled = false
    }
    
    let progressHUD = ProgressHUD()
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    
    var viewModel:LoginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MIVSharedSpace.Instance.delegate = self
        DispatchQueue.main.async(execute: {
            if (MIVSharedSpace.Instance.paresdData == nil){
                MIVSharedSpace.Instance.parseJSONFile()
                self.progressHUD.text = "Parsing..."
                self.view.addSubview(self.progressHUD)
                self.nextButton.isEnabled = false
                self.emailField.isEnabled = false
            }
        })
        
        
        
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.delegate = self as? UIGestureRecognizerDelegate
        self.view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        if (viewModel.validate(email: self.emailField.text!)) {
            if (viewModel.proceedWithAuth()) {
                MIVSharedSpace.Instance.setUserDefault(forKey: LOGIN_KEY, andData: true)
                let vc:MIVBaseTabViewController = MIVBaseTabViewController()
                self.present(vc, animated: true, completion: nil)
            }else{
                self.throwValidation(withTitle: "Auth failure", andMessage: "Something went wrong with auth")
            }
        }else{
            
            self.throwValidation(withTitle: "Validation Error", andMessage: "Enter a valid Email!")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func handleTap(){
        self.view.endEditing(true)
    }
    
    
}

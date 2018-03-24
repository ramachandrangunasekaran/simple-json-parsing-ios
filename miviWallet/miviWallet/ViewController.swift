//
//  ViewController.swift
//  miviWallet
//
//  Created by R@M on 24/03/18.
//  Copyright © 2018 ramachandran. All rights reserved.
//

import UIKit

class ViewController: UIViewController,JsonParserDelegate {
    func didCompletedParsing() {
        
    }
    
    func didErrorOnParsing(error: String) {
        self.throwValidation(withTitle: "Parsing Error", andMessage: "Something went wrong while parsing the json file : \(error)")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MIVSharedSpace.Instance.delegate = self
        DispatchQueue.main.async(execute: {
            if (MIVSharedSpace.Instance.paresdData == nil){
                MIVSharedSpace.Instance.parseJSONFile()
            }
        })
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



extension UIViewController {
    func throwValidation(withTitle: String, andMessage message:String){
        let myAlert = UIAlertController(title: withTitle, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel) {
            (result : UIAlertAction) -> Void in
        }
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
        
    }
  
    func returnVC<T>(text:String) -> T where T : UIViewController {
        let vc = MIVSharedSpace.Instance.storyBoard.instantiateViewController(withIdentifier: String(describing: T.self)) as! T
        return vc
        
    }
}

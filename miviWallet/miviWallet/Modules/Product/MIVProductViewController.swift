//
//  MIVProductViewController.swift
//  miviWallet
//
//  Created by R@M on 24/03/18.
//  Copyright © 2018 ramachandran. All rights reserved.
//

import UIKit

class MIVProductViewController: ViewController {

    @IBOutlet weak var isUnliitedCall: UILabel!
    @IBOutlet weak var isUnlimitedText: UILabel!
    @IBOutlet weak var priceField: UILabel!
    @IBOutlet weak var nameField: UILabel!
    var product:IncludeModel?{
        didSet{
            if let s  = product {
                nameField.text = s.attributes?.name
                priceField.text = s.attributes?.price?.toString()
                isUnlimitedText.text = (s.attributes?.isUnlimitedText)! ? "YES": "NO"
                isUnliitedCall.text = (s.attributes?.isUnlimitedTalk)! ? "YES": "NO"
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func didCompletedParsing() {
 
        product = MIVSharedSpace.Instance.subscriptionData
    }
    
    override func viewWillAppear(_ animated: Bool) {
        product = MIVSharedSpace.Instance.productData
    }


}

extension Int
{
    func toString() -> String
    {
        let myString = String(self)
        return myString
    }
}

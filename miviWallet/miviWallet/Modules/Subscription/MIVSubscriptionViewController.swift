//
//  MIVSubscriptionViewController.swift
//  miviWallet
//
//  Created by R@M on 24/03/18.
//  Copyright © 2018 ramachandran. All rights reserved.
//

import UIKit

class MIVSubscriptionViewController: ViewController {

    @IBAction func onRelationClick(_ sender: Any) {
        // create the alert
        let alert = UIAlertController(title: "INFO", message: "OOPS! I cant find the product for this subscription in this .json file.", preferredStyle: UIAlertControllerStyle.alert)
        
       
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    @IBOutlet weak var relationShipButton: UIButton!
    @IBOutlet weak var renewField: UILabel!
    @IBOutlet weak var expiryField: UILabel!
    @IBOutlet weak var balanceField: UILabel!
    @IBOutlet weak var id: UILabel!
    var subscription:IncludeModel?{
        didSet{
            if let s  = subscription {
                id.text = s.id
                balanceField.text = s.attributes?.includedDataBalance?.toString()
                expiryField.text = s.attributes?.expiryDate
                renewField.text = (s.attributes?.isAutoRenewal)! ? "YES": "NO"
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func didCompletedParsing() {
       
        relationShipButton.isEnabled = true
         subscription = MIVSharedSpace.Instance.subscriptionData
    }
    
    override func viewWillAppear(_ animated: Bool) {
        subscription = MIVSharedSpace.Instance.subscriptionData
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

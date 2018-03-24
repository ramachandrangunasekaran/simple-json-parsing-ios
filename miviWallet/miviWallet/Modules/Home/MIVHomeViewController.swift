//
//  MIVHomeViewController.swift
//  miviWallet
//
//  Created by R@M on 24/03/18.
//  Copyright © 2018 ramachandran. All rights reserved.
//

import UIKit

class MIVHomeViewController: ViewController {

    @IBOutlet weak var typeField: UILabel!
    @IBOutlet weak var mobileNumberField: UILabel!
    @IBOutlet weak var dobField: UILabel!
    @IBOutlet weak var namefield: UILabel!
    @IBOutlet weak var relationShipButton: UIButton!
    var data: DataModel?{
        didSet {
            if let d = data?.attributes {
                namefield.text = d.name
                mobileNumberField.text = d.contactNum
                dobField.text = d.dob
                typeField.text = d.paymentType
            }
        }
    }
    
    @IBAction func onRelationshipClicked(_ sender: Any) {
        // create the alert
        let alert = UIAlertController(title: "INFO", message: "This user has a service related to him. Do you want to view it. ", preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: {
            action in
            self.tabBarController?.selectedIndex = 1
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive, handler: nil))
    
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func didCompletedParsing() {
       
        relationShipButton.isEnabled = true
        data = MIVSharedSpace.Instance.userData
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

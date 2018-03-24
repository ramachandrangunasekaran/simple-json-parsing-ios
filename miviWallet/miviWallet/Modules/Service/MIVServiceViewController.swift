//
//  MIVServiceViewController.swift
//  miviWallet
//
//  Created by R@M on 24/03/18.
//  Copyright © 2018 ramachandran. All rights reserved.
//

import UIKit

class MIVServiceViewController: ViewController {

    @IBAction func onRelationShipClicked(_ sender: Any) {
        // create the alert
        let alert = UIAlertController(title: "INFO", message: "This Service has a subscription and user related to it. want to view! ", preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "View User", style: UIAlertActionStyle.default, handler: {
            action in
            self.tabBarController?.selectedIndex = 0
        }))
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "View Subscription", style: UIAlertActionStyle.default, handler: {
            action in
            self.tabBarController?.selectedIndex = 2
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    @IBOutlet weak var relationShipButton: UIButton!
    @IBOutlet weak var thresholdField: UILabel!
    @IBOutlet weak var creditField: UILabel!
    @IBOutlet weak var msnField: UILabel!
    @IBOutlet weak var id: UILabel!
    var service:IncludeModel?{
        didSet{
            if let s  = service {
                id.text = s.id
                msnField.text = s.attributes?.msn
                creditField.text = s.attributes?.credit?.toString()
                thresholdField.text = (s.attributes?.isDataUsageThreshold)! ? "YES": "NO"
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func didCompletedParsing() {
        
        relationShipButton.isEnabled = true
        service = MIVSharedSpace.Instance.serviceData
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
       service = MIVSharedSpace.Instance.serviceData
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

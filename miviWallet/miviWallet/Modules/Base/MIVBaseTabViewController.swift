//
//  MIVBaseTabViewController.swift
//  miviWallet
//
//  Created by R@M on 24/03/18.
//  Copyright © 2018 ramachandran. All rights reserved.
//

import UIKit

class MIVBaseTabViewController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
         UITabBar.appearance().tintColor  =  .red
         let homeVc:MIVHomeViewController = returnViewController(text: "User")
         let productVc:MIVProductViewController = returnViewController(text: "Product")
         let subVc:MIVSubscriptionViewController = returnViewController(text: "Subscription")
         let serviceVC:MIVServiceViewController = returnViewController(text: "Service")
         let moreVC:MIVMoreViewController = returnViewController(text: "More")
        viewControllers=[homeVc,serviceVC,subVc,productVc,moreVC]
        
      
        
    }
    
    
    
    
    func returnViewController<T>(text:String) -> T where T : UIViewController {
        let vc = MIVSharedSpace.Instance.storyBoard.instantiateViewController(withIdentifier: String(describing: T.self)) as! T
        vc.tabBarItem.title = text
        vc.tabBarItem.image = UIImage.init(named: text)
        return vc
        
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





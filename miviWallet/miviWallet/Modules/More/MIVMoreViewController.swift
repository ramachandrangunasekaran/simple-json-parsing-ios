//
//  MIVMoreViewController.swift
//  miviWallet
//
//  Created by R@M on 24/03/18.
//  Copyright © 2018 ramachandran. All rights reserved.
//

import UIKit

class MIVMoreViewController: ViewController {

    @IBAction func onLogOutClicked(_ sender: Any) {
        MIVSharedSpace.Instance.removeKeyFromUserDefault(forKey: LOGIN_KEY)
        DispatchQueue.main.async {
            let vc:MIVLoginViewController = self.returnVC(text: "Login")
            self.present(vc, animated: true, completion: nil)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

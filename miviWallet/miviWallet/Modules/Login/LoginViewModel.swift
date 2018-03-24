//
//  LoginViewModel.swift
//  miviWallet
//
//  Created by R@M on 24/03/18.
//  Copyright © 2018 ramachandran. All rights reserved.
//

import UIKit

class LoginViewModel: NSObject {

    
    var emailAddress:String = ""
    
    func validate(email:String) ->Bool {
        self.emailAddress = email
        guard  (email != nil) , MIVSharedSpace.Instance.isValidEmail(testStr: email.trimmingCharacters(in: .whitespaces)) else{
            return false
        }
        return true
    }
    
    
    func proceedWithAuth()->Bool{
        if let userData = MIVSharedSpace.Instance.userData {
            return userData.attributes?.emailAddress == self.emailAddress
        }
        return false
    }
    
    
}

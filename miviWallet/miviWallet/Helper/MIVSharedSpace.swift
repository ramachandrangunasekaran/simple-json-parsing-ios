//
//  MIVSharedSpace.swift
//  miviWallet
//
//  Created by R@M on 24/03/18.
//  Copyright © 2018 ramachandran. All rights reserved.
//

import Foundation
import UIKit
let LOGIN_KEY = "loginKey"

protocol JsonParserDelegate{
    func didCompletedParsing()
    func didErrorOnParsing(error:String)
}


class MIVSharedSpace:NSObject {
    
    
    
    var delegate:JsonParserDelegate?
    
    var storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    var userData: DataModel?
    var serviceData: IncludeModel?
    var subscriptionData: IncludeModel?
    var productData: IncludeModel?
    
    var ud = UserDefaults()
    
    var paresdData: ResponseModel? {
        didSet{
            if let d = paresdData {
                userData = d.data!
                if d.included.count == 3 {
                    serviceData = d.included[0]
                    subscriptionData = d.included[1]
                    productData = d.included[2]
                }
                
            }
        }
    }
    
    
    
    // MARK: Singleton
    class var Instance : MIVSharedSpace {
        struct sInstance {
            static let instance = MIVSharedSpace()
        }
        return sInstance.instance
    }
    
    
    func parseJSONFile()->Void {
        if let resourceBundle = Bundle.init(path: Bundle.main.path(forResource: "miviWallet", ofType: "bundle")!) {
            if let url = resourceBundle.url(forResource: "collection", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    self.paresdData = try decoder.decode(ResponseModel.self, from: data)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) { 
                        self.delegate?.didCompletedParsing()
                    }
                    
                    return
                } catch {
                    self.paresdData = nil
                    print("error:\(error)")
                    delegate?.didErrorOnParsing(error: error.localizedDescription)
                    return
                }
            }
        }
        self.paresdData = nil
        delegate?.didErrorOnParsing(error: "Internal Error")
        return
    }
    
    
    func setUserDefault(forKey:String, andData data:Any){
        ud.setZBData(forKey: forKey, withData: data)
    }
    
    func removeKeyFromUserDefault(forKey:String){
        ud.removeObject(forKey: forKey)
    }
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return ud.object(forKey: key) != nil
    }
    
    func getUserDefault(forKey:String) -> Any?{
        return ud.getZBData(forKey: forKey)
    }
    
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
}




extension UserDefaults{
    
    
    func getZBData(forKey:String) ->Any?{
        return value(forKey: forKey)
    }
    
    func setZBData(forKey:String, withData data:Any?){
        set(data, forKey: forKey)
    }
    
    
}




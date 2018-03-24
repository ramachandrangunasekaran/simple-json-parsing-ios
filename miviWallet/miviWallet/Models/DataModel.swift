//
//  DataModel.swift
//  miviWallet
//
//  Created by R@M on 24/03/18.
//  Copyright © 2018 ramachandran. All rights reserved.
//

import Foundation


struct ResponseModel: Decodable {
    var data: DataModel? = DataModel()
    var included: [IncludeModel] = [IncludeModel()]
    
    enum CodingKeys: String, CodingKey {
        case data
        case included
    }

}


struct DataModel:Decodable {
    var type :String = ""
    var id : String = ""
    var attributes: AttributesModel? = AttributesModel()
    var links:LinksModel? = LinksModel()
    var relationships:RelationShipModel? = RelationShipModel()
    enum CodingKeys: String, CodingKey {
        case type
        case id
        case attributes
        case links
        case relationships
    }
}


struct RelationShipModel:Decodable {
    var services:ServicesModel? = ServicesModel()
    var subscriptions:SubscriptionModel? = SubscriptionModel()
    var product: ProductModel? = ProductModel()
    var downgrade : ProductModel?  = ProductModel()
    enum CodingKeys: String, CodingKey {
        case downgrade
        case product
        case subscriptions
        case services
    }
}

struct ProductModel:Decodable {
    var data: RelationShipDataModel? = RelationShipDataModel()
    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct SubscriptionModel:Decodable {
    var links:LinksModel? = LinksModel()
    var data: [RelationShipDataModel]? = [RelationShipDataModel()]
    enum CodingKeys: String, CodingKey {
        case links
        case data
    }
}

struct RelationShipDataModel : Decodable {
    var type:String? = ""
    var id:String? = ""
    enum CodingKeys: String, CodingKey {
        case type
        case id
    }
    
}

struct ServicesModel:Decodable {
    var links:LinksModel? = LinksModel()
    enum CodingKeys: String, CodingKey {
        case links
    }
}

struct LinksModel:Decodable {
    var myURL:String? = ""
    var relatedURL:String? = ""
    enum CodingKeys: String, CodingKey {
        case myURL = "self"
        case relatedURL = "related"
    }
}


struct AttributesModel:Decodable {

    var paymentType: String? = ""
    var unbilledCharges:String? = ""
    var nextBillingDate:String? = ""
    var title:String? = ""
    var firstName:String? = ""
    var lastName:String? = ""
    var dob:String? = ""
    var name:String? {
        return title! + ". " + firstName! + " " + lastName!
    }
    var contactNum:String? = ""
    var emailAddress:String? = ""
    var isEmailVerified:Bool? = false
    var isEmailSubscribed:Bool?  = false
    enum CodingKeys: String, CodingKey {
        case title
        case paymentType = "payment-type"
        case unbilledCharges = "unbilled-charges"
        case nextBillingDate = "next-billing-date"
        case firstName = "first-name"
        case lastName = "last-name"
        case dob = "date-of-birth"
        case contactNum = "contact-number"
        case emailAddress = "email-address"
        case isEmailVerified = "email-address-verified"
        case isEmailSubscribed = "email-subscription-status"
    }

}


struct IncludeModel:Decodable {
    var type:String? = ""
    var id:String? = ""
    var attributes: IncludeAttributesModel? = IncludeAttributesModel()
    var links: LinksModel? = LinksModel()
    var relationships:RelationShipModel? = RelationShipModel()
    
}

struct IncludeAttributesModel:Decodable {
    var msn:String? = ""
    var credit:Int? = 0
    var creditExpiry:String? = ""
    var isDataUsageThreshold:Bool? = false
    var name:String? = ""
    var includedData:String? = ""
    var includedCredit:String? = ""
    var includedInternationalTalk:String? = ""
    var isUnlimitedText:Bool? = false
    var isUnlimitedTalk:Bool? = false
    var isUnlimitedInternationalText:Bool? = false
    var isUnlimitedInternationalTalk:Bool? = false
    var price:Int? = 0
    var includedDataBalance:Int? = 0
    var includedCreditBalance:String? = ""
    var includedRollOverCreditBalance:String? = ""
    var includedRollOverDataBalance:String? = ""
    var includedInternationalTalkBalance:String? = ""
    var expiryDate:String? = ""
    var isAutoRenewal:Bool? = false
    var isPrimarySubscription:Bool? = false
    
    
    enum CodingKeys: String, CodingKey {
        case msn
        case credit
        case name
        case creditExpiry = "credit-expiry"
        case isDataUsageThreshold = "data-usage-threshold"
        case includedData = "included-data"
        case includedCredit = "included-credit"
        case includedInternationalTalk = "included-international-talk"
        case isUnlimitedText = "unlimited-text"
        case isUnlimitedTalk = "unlimited-talk"
        case isUnlimitedInternationalText = "unlimited-international-text"
        case isUnlimitedInternationalTalk = "unlimited-international-talk"
        case includedDataBalance = "included-data-balance"
        case includedCreditBalance = "included-credit-balance"
        case includedRollOverCreditBalance = "included-rollover-credit-balance"
        case includedRollOverDataBalance = "included-rollover-data-balance"
        case includedInternationalTalkBalance = "included-international-talk-balance"
        case expiryDate = "expiry-date"
        case isAutoRenewal = "auto-renewal"
        case isPrimarySubscription = "primary-subscription"
    }
    
}





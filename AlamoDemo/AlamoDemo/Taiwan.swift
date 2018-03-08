//
//  Taiwan.swift
//  AlamoDemo
//
//  Created by 黃佳雯 on 2018/3/8.
//  Copyright © 2018年 Zencher. All rights reserved.
//

import Foundation

struct TaiwanOpenData : Codable{
    var XML_Head: Detail
    
}

struct Detail : Codable{
    var Infos:Details
    var language: String
    var listname: String
    var orgname: String
    var updatetime: String
}

struct Details : Codable{
    var Info :[Information]
}

struct  Information : Codable{
    var Add:String
    var Changetime:String
    var Class1:String
    var Class2:String
    var Class3:String
    var Description:String
    var Gov:String
    var Id:String
    var Keyword:String
    var Level:String
    var Map:String
    var Name:String
    var Opentime:String
    var Orgclass:String
    var Parkinginfo:String
    var Parkinginfo_Px:String
    var Parkinginfo_Py:String
    var Picdescribe1:String
    var Picdescribe2:String
    var Picdescribe3:String
    var Picture1:String
    var Picture2:String
    var Picture3:String
    var Px:String
    var Py:String
    var Remarks:String
    var Tel:String
    var Ticketinfo:String
    var Toldescribe:String
    var Travellinginfo:String
    var Website:String
    var Zipcode:String
    var Zone:String
}








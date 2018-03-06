//
//  OpenStruct.swift
//  AlamoDemo
//
//  Created by Michael on 06/03/2018.
//  Copyright © 2018 Zencher. All rights reserved.
//

import Foundation

struct OpenData : Codable{
    var result:Result
}

struct Result : Codable {
    var offset:Int
    var limit:Int
    var count:Int
    var sort:String
    var results:[Association]
}

struct Association : Codable {
    var _id:String
    var 縣市別:String
    var 機構名稱:String
    var 機構地址:String
    var 聯絡電話:String
    var 申請許可事項:String
    var 核准日期:String
    var 機關網址:String
}



//
//  ZMMJsonParserKit.swift
//  ZMMDataparser
//
//  Created by miao on 2019/5/31.
//  Copyright © 2019年 miao. All rights reserved.
//

import UIKit

class ZMMJsonParserKit: NSObject,ZMMJsonParserProtocol {
    
    func decodeToJsonDictFromJsonData(jsonData: NSData) -> NSDictionary {
       
        let dict = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
        
    }
    func decodeToJsonArrayFromJsonData(jsonData:NSData) -> NSArray{
        let arry = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers)
        if arry != nil {
            return arry as! NSArray
        }
        return NSArray()
    }
    
    func decodeToJsonDictFromJsonString(jsonString: String) -> NSDictionary {
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        let dict = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
    
    }
    func decodeToJsonArrayFromJsonString(jsonString:String) -> NSArray{
        let jsonData:Data = jsonString.data(using: .utf8)!
        let array = self.decodeToJsonArrayFromJsonData(jsonData: jsonData as NSData);
        return array;
    }
    
    func encodeToJsonStringFromJsonDict(JsonDict:NSDictionary) -> NSString{
        var jsonString:NSString = ""
        
        if JSONSerialization .isValidJSONObject(JsonDict){
            
            let data : NSData! = try? JSONSerialization.data(withJSONObject:JsonDict, options: []) as NSData
            jsonString = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)!
            return jsonString
            
        }
        return jsonString
    }
    
    func encodeToJsonArrayFromJsonArray(JsonArray: NSArray) -> NSString {
        var jsonString:NSString = ""
        //数组——NSData——字符串
        if JSONSerialization .isValidJSONObject(JsonArray){
        
            let data : NSData! = try? JSONSerialization.data(withJSONObject:JsonArray, options: []) as NSData
            jsonString = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)!
            return jsonString
            
        }
        return jsonString
        
    }
    
    
}

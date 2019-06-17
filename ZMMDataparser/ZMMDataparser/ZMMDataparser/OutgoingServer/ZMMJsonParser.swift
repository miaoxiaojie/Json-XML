//
//  ZMMJsonParser.swift
//  ZMMDataparser
//
//  Created by miao on 2019/5/31.
//  Copyright © 2019年 miao. All rights reserved.
//

import UIKit

class ZMMJsonParser: NSObject {
    public static func decodeToDictFromData(jsonData: NSData) -> NSDictionary {
        
        let object = ZMMJsonParserKit()
        return object.decodeToJsonDictFromJsonData(jsonData:jsonData)
        
    }
    public static func decodeToDictFromString(jsonString: String) -> NSDictionary {
        
        let object = ZMMJsonParserKit()
        return object.decodeToJsonDictFromJsonString(jsonString:jsonString)
        
    }
    
    public static func encodeToStringFromDict(JsonDict:NSDictionary) -> NSString{
        let object = ZMMJsonParserKit()
        return object.encodeToJsonStringFromJsonDict(JsonDict:JsonDict)
        
    }

}

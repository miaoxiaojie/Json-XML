//
//  ZMMJsonParserProtocol.swift
//  ZMMDataparser
//
//  Created by miao on 2019/5/31.
//  Copyright © 2019年 miao. All rights reserved.
//

import Foundation
import UIKit

protocol ZMMJsonParserProtocol {
    
    ///  NSData——>字典
    ///
    /// - Parameter jsonData: jsonData
    /// - Returns: 字典
    func decodeToJsonDictFromJsonData(jsonData: NSData) -> NSDictionary
    
    /// NSData——>数组
    ///
    /// - Parameter jsonData: jsonData
    /// - Returns: 数组
    func decodeToJsonArrayFromJsonData(jsonData:NSData) -> NSArray
    
    /// 字符串——>字典
    ///
    /// - Parameter jsonString: jsonString
    /// - Returns: 字典
    func decodeToJsonDictFromJsonString(jsonString:String) -> NSDictionary
    
    ///  字符串——>数组
    ///
    /// - Parameter jsonString: jsonString
    /// - Returns: 数组
    func decodeToJsonArrayFromJsonString(jsonString:String) -> NSArray
    
    /// 字典——>字符串
    ///
    /// - Parameter JsonDict: 字典
    /// - Returns: 字符串
    func encodeToJsonStringFromJsonDict(JsonDict:NSDictionary) -> NSString
    
    
    ///数组——>字符串
    ///
    /// - Parameter JsonArray: 数组
    /// - Returns: 字符串
    func encodeToJsonArrayFromJsonArray(JsonArray:NSArray) -> NSString
    

   
}

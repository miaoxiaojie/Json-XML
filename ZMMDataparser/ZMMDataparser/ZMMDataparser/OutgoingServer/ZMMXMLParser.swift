//
//  ZMMXMLParser.swift
//  ZMMDataparser
//
//  Created by miao on 2019/6/5.
//  Copyright © 2019年 miao. All rights reserved.
//

import UIKit

class ZMMXMLParser: NSObject {
    
  public static func parsingToDictFromFile(filePath: NSString) -> NSDictionary
  {
    let object = ZMMXMLParserKit()
    return object.parsingToDictFromFile(filePath:filePath)
    }
}

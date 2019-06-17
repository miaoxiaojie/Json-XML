//
//  ZMMXMLParserProtocol.swift
//  ZMMDataparser
//
//  Created by miao on 2019/6/5.
//  Copyright © 2019年 miao. All rights reserved.
//

import Foundation
import UIKit

protocol ZMMXMLParserProtocol {
    
   /// xml文件——字典
   ///
   /// - Parameter filePath: 路径
   /// - Returns: <#return value description#>
   func parsingToDictFromFile(filePath: NSString) -> NSDictionary
   
}


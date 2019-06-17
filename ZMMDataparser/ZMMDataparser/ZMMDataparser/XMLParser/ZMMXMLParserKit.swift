//
//  ZMMXMLParserKit.swift
//  ZMMDataparser
//
//  Created by miao on 2019/6/5.
//  Copyright © 2019年 miao. All rights reserved.
//

import UIKit

//用户对象
struct User {
    var id: String?  //编号
    var name: String? //姓名
   
}


class ZMMXMLParserKit: NSObject,
                       ZMMXMLParserProtocol,
                       XMLParserDelegate{
    //保存最终解析的结果
    var users:[User] = []
    //当前元素名
    var currentElement = ""
    //当前用户
    var user:User!
    
    func parsingToDictFromFile(filePath: NSString) -> NSDictionary
    {
        let url = NSURL(fileURLWithPath: filePath as String)
        let parser = XMLParser(contentsOf: url as URL)
        parser?.delegate = self
        parser?.parse()
        let result = NSDictionary.init(object: users, forKey: "result" as NSCopying)
        return result;
        
    }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        currentElement = elementName
        //当elementName是 "User"时，表示开始解析一个新用户了
        if elementName == "User"{
            //创建一个新用户对象
            user = User()
            //保存下id
            user.id = attributeDict["id"]
        }
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: .whitespacesAndNewlines)
        //接下来每遇到一个字符，将该字符追加到相应的 property 中
        switch currentElement{
        case "name":
            user.name = user.name ?? "" + data
        case "id":
            user.id = user.id ?? "" + data
        default:
            break
        }
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        //标签User结束时将该用户对象，存入数组容器。
        if elementName == "User"{
            users.append(user)
        }
        
    }

}

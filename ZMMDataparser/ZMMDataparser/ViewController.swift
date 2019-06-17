//
//  ViewController.swift
//  ZMMDataparser
//
//  Created by miao on 2019/5/31.
//  Copyright © 2019年 miao. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,
                      UITableViewDelegate,
                      UITableViewDataSource{
    
    var testUItableview:UITableView?
    let dataList:[String] = ["jsonData 解析为字典","jsonSring 解析为字典","字典解析为字符串","XML文件解析"]
    let cellId = "MyCell"
    var originalDtata:Any?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.creatTableView()
    
    }
    
    func creatTableView() {
        self.testUItableview = UITableView(frame:self.view.frame,style:.plain)
        self.testUItableview?.delegate = self
        self.testUItableview?.dataSource = self
        self.testUItableview?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        self.view.addSubview(self.testUItableview!)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellId)
        }
        cell.textLabel?.text = self.dataList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.creatAlertView(title: "", msg: "\(indexPath.row)")
            break
        case 1:
            originalDtata = "{\"pSwitch\":\"0\"}";
            let parsedData = [ZMMJsonParser .decodeToDictFromString(jsonString: originalDtata as! String)];
            print("原始数据%@,\n",originalDtata!)
            print("解析后的数据%@",parsedData)
            break
        case 2:
            originalDtata = ["pSwitch":"1"]
            let parsedData = [ZMMJsonParser .encodeToStringFromDict(JsonDict: originalDtata as! NSDictionary)]
            print("原始数据%@,\n",originalDtata!)
            print("解析后的数据%@",parsedData)
            break
        case 3:
            let filePath:NSString = Bundle.main.path(forResource:"book",
                                                     ofType:"xml")! as NSString
            let parsedData = [ZMMXMLParser .parsingToDictFromFile(filePath:filePath)]
            print(parsedData)
            break
        
        default:
            break
        }
    }
    func creatAlertView(title:Any?,msg:Any?){
        let hAlertView = UIAlertController(title:title as! String,
                                           message:msg as! String,
                                           preferredStyle:.alert)
        let cancelAction = UIAlertAction(title:"取消",
                                         style:.cancel,
                                         handler:nil)
        let okAction = UIAlertAction(title:"好的",
                                     style:.default)
        hAlertView.addAction(cancelAction)
        hAlertView.addAction(okAction)
        self.present(hAlertView, animated: true, completion: nil)
        
    }
    
}


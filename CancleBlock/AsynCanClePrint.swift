//
//  AsynCanClePrint.swift
//  CancleBlock
//
//  Created by lotawei on 17/1/22.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit
typealias priBlock = (_ str:String) -> Void

class AsynCanClePrint: NSObject {
    
        
   private var    prblock:priBlock?
    var    prindatastring:String = ""
    
   var  index = 0
    var   iscancle  =   false
      override init() {
        super.init()
    }
    
    convenience  init(prblock:@escaping priBlock) {
        
        self.init()
        self.prblock = prblock
        
        
    }
    //创建开始任务
    func start()  {
     
     let   dispa =   DispatchQueue(label: "back")
        dispa.async {
            weak  var tmpself = self

            while(true){
                Thread.sleep(forTimeInterval: 1.0)
                tmpself?.index += 1
                if   (!(tmpself?.iscancle)!) {
                    
                    if   tmpself?.prblock != nil{
                        
                        tmpself?.prblock!((tmpself?.getstr(index: (tmpself?.index)!))!)
                        
                    }
                    
                }
                else
                {
                    print("任务已取消")
                    return
                }
            }
        }
        
    }
    func  getstr(index:NSInteger) ->String {
        
        if index > prindatastring.characters.count || index < 0{
            return  "越界"
        }
        else{
        let  range = NSRange(location: index, length: 1)
        return  "\((prindatastring as NSString).substring(with: range))"
        }
        
    }
    
    //取消任务
    func cancel()  {
        iscancle = true
    }
    
    
    

}

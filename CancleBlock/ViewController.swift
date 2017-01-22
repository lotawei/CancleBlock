//
//  ViewController.swift
//  CancleBlock
//
//  Created by lotawei on 17/1/22.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var    datas:String =  "利用闭包（block），采用函数式编程思想，将一段代码作为参数传入方法中，在需要向外回调时，直接调用之前传进来的代码。利用闭包（block），采用函数式编程思想，将一段代码作为参数传入方法中，在需要向外回调时，直接调用之前传进来的代码。利用闭包（block），采用函数式编程思想，将一段代码作为参数传入方法中，在需要向外回调时，直接调用之前传进来的代码。利用闭包（block），采用函数式编程思想，将一段代码作为参数传入方法中，在需要向外回调时，直接调用之前传进来的代码。利用闭包（block），采用函数式编程思想，将一段代码作为参数传入方法中，在需要向外回调时，直接调用之前传进来的代码。利用闭包（block），采用函数式编程思想，将一段代码作为参数传入方法中，在需要向外回调时，直接调用之前传进来的代码。利用闭包（block），采用函数式编程思想，将一段代码作为参数传入方法中，在需要向外回调时，直接调用之前传进来的代码。"
    
    @IBOutlet weak var mytext: UITextView!
    var    asynbackwork : AsynCanClePrint?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        asynbackwork = AsynCanClePrint(prblock: { str in
            
            DispatchQueue.main.sync {
                weak    var tmp = self
                
                
                tmp?.mytext.text.append(str)

                
            }
            
        })
        asynbackwork?.prindatastring = datas
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func begin(_ sender: Any) {
        
        asynbackwork?.start()
        
        
    }
  

    @IBAction func cancle(_ sender: Any) {
        
        asynbackwork?.cancel()
        
        
        
    }
    
    
}


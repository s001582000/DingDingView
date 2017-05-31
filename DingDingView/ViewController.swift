//
//  ViewController.swift
//  DingDingView
//
//  Created by 梁雅軒 on 2017/5/31.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

class ViewController: UIViewController,DDViewDelegate{
    var ddView:DDView!
    @IBOutlet weak var lblReturn: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnOnClick(_ sender: UIButton) {
        if ddView == nil {
            ddView = DDView(arrData: ["1","2","3"])
            ddView.delegate = self
            self.view.addSubview(ddView)
        }
        ddView.willShow()
    }
    
    func ddViewDidSelect(message: String, ddView: DDView) {
        lblReturn.text = message
        ddView.willHide()
    }

}


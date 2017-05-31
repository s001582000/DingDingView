//
//  DDView.swift
//  DingDingView
//
//  Created by 梁雅軒 on 2017/5/31.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

protocol DDViewDelegate {
    func ddViewDidSelect(message:String,ddView:DDView)
}

class DDView: UIView,UIPickerViewDelegate,UIPickerViewDataSource {
    var delegate:DDViewDelegate?
    private var mArrData = [String]()
    init(arrData:[String]) {
        super.init(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height / 5 * 2))
        mArrData = arrData
        let pickerView = UIPickerView(frame: self.bounds)
        pickerView.delegate = self
        pickerView.dataSource = self
        self.addSubview(pickerView)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mArrData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return mArrData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.ddViewDidSelect(message: mArrData[row],ddView: self)
    }
    
    func willShow() {
        var rect = self.frame
        if rect.origin.y >= UIScreen.main.bounds.height{
            UIView.animate(withDuration: 0.3) {
                
                rect.origin.y -= self.frame.size.height
                self.frame = rect
            }
        }
        
    }
    
    func willHide() {
        UIView.animate(withDuration: 0.3) {
            var rect = self.frame
            rect.origin.y += self.frame.size.height
            self.frame = rect
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

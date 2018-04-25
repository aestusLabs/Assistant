//
//  CalendarWeekView.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-20.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class CalendarWeekView: UIView {

    @IBOutlet weak var mondayView: UIView!
    
    @IBOutlet weak var tuesdayView: UIView!
    
    @IBOutlet weak var wednesdayView: UIView!
    
    @IBOutlet weak var thursdayView: UIView!
    
    @IBOutlet weak var fridayView: UIView!
    
    
    @IBOutlet weak var saturdayView: UIView!
    
    @IBOutlet weak var sundayView: UIView!
    
    
    class func instanceFromNib() -> CalendarWeekView {
        return UINib(nibName: "CalendarWeekView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CalendarWeekView
    }

    func setUpView() {
        let views = [mondayView, tuesdayView, wednesdayView, thursdayView, fridayView, saturdayView, sundayView]
        var count = 1001
        for view in views {
//            view?.layer.cornerRadius = 17.5
            
            view?.backgroundColor = getColourFor.lightGrey()
            view?.tag = count
            count += 1
        }
    }
}

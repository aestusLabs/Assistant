//
//  TransformingCalendarTableViewCell.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-20.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class TransformingCalendarTableViewCell: UITableViewCell {

    @IBOutlet weak var cardBackground: UIView!
    @IBOutlet weak var calendarView: UIView!
   
    @IBOutlet weak var calendarViewHeight: NSLayoutConstraint!
    
    
    let weekCalendar: CalendarWeekView = CalendarWeekView.instanceFromNib() 
    let monthCalendar = CalendarCollectionViewView.instanceFromNib() //CalendarMonthView.instanceFromNib()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        makeCardFrom(view: cardBackground)
//            showWeekView()
        showMonthView()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func addConstraintsToCalendar(subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: calendarView, attribute: .top, multiplier: 1.0, constant: 0.0)
        let leftConstraint = NSLayoutConstraint(item: subview, attribute: .left, relatedBy: .equal, toItem: calendarView, attribute: .left, multiplier: 1.0, constant: 0.0)
        let rightConstraint = NSLayoutConstraint(item: subview, attribute: .right, relatedBy: .equal, toItem: calendarView, attribute: .right, multiplier: 1.0, constant: 0.0)
        let bottomConstraint = NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: calendarView, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        calendarView.addConstraints([topConstraint, leftConstraint, rightConstraint, bottomConstraint])
    }
    func showMonthView() {

        
//        monthCalendar.collectionView.setItemsInRow(items: 7)
        
       
        calendarView.addSubview(monthCalendar)
        addConstraintsToCalendar(subview: monthCalendar)
         calendarViewHeight.constant = monthCalendar.collectionView.collectionViewLayout.collectionViewContentSize.height
//        monthCalendar.collectionView.setItemsInRow(items: 4)
//        monthCalendar.collectionView.setItemsInRow(items: 7)
        
//        monthCalendar.setUpView()
//        calendarView.addSubview(monthCalendar)
//        monthCalendar.collectionView.setItemsInRow(items: 7)
//
//        calendarViewHeight.constant = monthCalendar.collectionView.collectionViewLayout.collectionViewContentSize.height + 30 //374
//
//        calendarView.addSubview(monthCalendar)
//        addConstraintsToCalendar(subview: monthCalendar)
//        monthCalendar.collectionView.setItemsInRow(items: 6)
//        monthCalendar.collectionView.setItemsInRow(items: 7)
        
        
        
        
        
        
//        let height = monthCalendar.collectionView.collectionViewLayout.collectionViewContentSize.height //.setHeight()
//        print(height)
//
////        monthCalendar.clipsToBounds = true
//        calendarViewHeight.constant =  height // + 30 The collection view is actually goiin gpast the bottom of the card background but clips to bounds cuts it off.
//        print(monthCalendar.frame.height)
//
////        self.layoutIfNeeded()
//        addConstraintsToCalendar(subview: monthCalendar)
    }
    
    func showWeekView() {
        calendarViewHeight.constant = 35
        calendarView.addSubview(weekCalendar)
        addConstraintsToCalendar(subview: weekCalendar)
        weekCalendar.setUpView()
    
    }
}

//
//  CalendarMonthView.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-20.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class CalendarMonthView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    let reuseIdentifier = "numberAndCircleCell"
    let numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]
   
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.dataSource = self
        
        self.collectionView.delegate = self
   
        self.collectionView.register(UINib.init(nibName: "NumberAndCircleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "numberAndCircleCell")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! NumberAndCircleCollectionViewCell
        
        cell.label.text = numbers[indexPath.item]
        
//        cell.circleView.backgroundColor = UIColor.clear
//        cell.circleView.backgroundColor = UIColor.black
//        cell.
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
//        cell.myLabel.text = self.items[indexPath.item]
        
        return cell
    }
    
    
    
    
//    func setHeight() -> CGFloat{
//        let height = collectionView.collectionViewLayout.collectionViewContentSize.height
//        collectionViewHeight.constant = height
//        print(height)
//        self.setNeedsLayout()
//        print(collectionView.frame.height)
//        return height
//    }
    
    
    
    
    
    
    let circleWithNumber: NumberWithCircleView = NumberWithCircleView.instanceFromNib()
    
    class func instanceFromNib() -> CalendarMonthView {
        return UINib(nibName: "CalendarMonthView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CalendarMonthView
    }
    
   
    
//    func addConstraintsToCalendar(subview: UIView, viewToAddTo: UIView) {
//        subview.translatesAutoresizingMaskIntoConstraints = false
//        let topConstraint = NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: viewToAddTo, attribute: .top, multiplier: 1.0, constant: 0.0)
//        let leftConstraint = NSLayoutConstraint(item: subview, attribute: .left, relatedBy: .equal, toItem: viewToAddTo, attribute: .left, multiplier: 1.0, constant: 0.0)
//        let rightConstraint = NSLayoutConstraint(item: subview, attribute: .right, relatedBy: .equal, toItem: viewToAddTo, attribute: .right, multiplier: 1.0, constant: 0.0)
//        let bottomConstraint = NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: viewToAddTo, attribute: .bottom, multiplier: 1.0, constant: 0.0)
//        viewToAddTo.addConstraints([topConstraint, leftConstraint, rightConstraint, bottomConstraint])
//    }
    func setUpView() {
//        self.collectionView.dataSource = self
//
//        self.collectionView.delegate = self
//
//
////        let columnsLayout = ColumnFlowLayout(cellsPerRow: 7, minimumInteritemSpacing: 10, minimumLineSpacing: 10, sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
//
////        collectionView.collectionViewLayout = columnsLayout
////        collectionView.contentInsetAdjustmentBehavior = .always
//
//        self.collectionView.register(UINib.init(nibName: "NumberAndCircleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "numberAndCircleCell")
//        let allViews = getAllViews()
//        for view in allViews {
//           let circleWithNumber = view as! NumberWithCircleView
////            circleWithNumber.numberLabel
//
//        }
    }

    
    
}

extension UICollectionView {
    func setItemsInRow(items: Int) {
        if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            let contentInset = self.contentInset
            let itemsInRow: CGFloat = CGFloat(items);
            let innerSpace = layout.minimumInteritemSpacing * (itemsInRow - 1.0)
            let insetSpace = contentInset.left + contentInset.right + layout.sectionInset.left + layout.sectionInset.right
            let width = floor((frame.width - insetSpace - innerSpace) / itemsInRow)
            layout.itemSize = CGSize(width: width, height: width)
        }
    }
}



//class ColumnFlowLayout: UICollectionViewFlowLayout {
//
//    let cellsPerRow: Int
//
//    init(cellsPerRow: Int, minimumInteritemSpacing: CGFloat = 0, minimumLineSpacing: CGFloat = 0, sectionInset: UIEdgeInsets = .zero) {
//        self.cellsPerRow = cellsPerRow
//        super.init()
//
//        self.minimumInteritemSpacing = minimumInteritemSpacing
//        self.minimumLineSpacing = minimumLineSpacing
//        self.sectionInset = sectionInset
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func prepare() {
//        super.prepare()
//
//        guard let collectionView = collectionView else { return }
//        let marginsAndInsets = sectionInset.left + sectionInset.right + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
//        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
//        itemSize = CGSize(width: itemWidth, height: itemWidth)
//    }
//
//    override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
//        let context = super.invalidationContext(forBoundsChange: newBounds) as! UICollectionViewFlowLayoutInvalidationContext
//        context.invalidateFlowLayoutDelegateMetrics = newBounds.size != collectionView?.bounds.size
//        return context
//    }
//
//}


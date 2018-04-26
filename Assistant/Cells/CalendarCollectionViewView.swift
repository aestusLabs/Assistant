//
//  CalendarCollectionViewView.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-25.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import UIKit

class CalendarCollectionViewView: UIView, UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet weak var height: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    var numberOfItems = 30
    let firstDayOfMonth = Date().firstDayOfTheMonth.weekday - 1 + 5
    var dayCount = 1

    let columnLayout = ColumnFlowLayout(
        cellsPerRow: 7,
        minimumInteritemSpacing: 10,
        minimumLineSpacing: 10,
        sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    )
    override func awakeFromNib() {
        super.awakeFromNib()
        print("Awoken")
        
        print(firstDayOfMonth)
        numberOfItems += firstDayOfMonth
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView?.collectionViewLayout = columnLayout
        collectionView?.contentInsetAdjustmentBehavior = .always
        self.collectionView.register(UINib.init(nibName: "NumberAndCircleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "numberAndCircleCell")
        print(collectionView.collectionViewLayout.collectionViewContentSize.height)
        
        //        collectionView.setItemsInRow(items: 3)

   
        self.layoutIfNeeded()
        height.constant = collectionView.collectionViewLayout.collectionViewContentSize.height
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "numberAndCircleCell", for: indexPath as IndexPath) as! NumberAndCircleCollectionViewCell
        
        if indexPath.item < firstDayOfMonth {
            cell.label.text = ""
            cell.circleView.isHidden = true
        } else {
            cell.label.text = "\(dayCount)"
            dayCount += 1
        }
        return cell
    }
    class func instanceFromNib() -> CalendarCollectionViewView {
        return UINib(nibName: "CalendarCollectionViewView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CalendarCollectionViewView
    }


}
class ColumnFlowLayout: UICollectionViewFlowLayout {
    
    let cellsPerRow: Int
    
    init(cellsPerRow: Int, minimumInteritemSpacing: CGFloat = 0, minimumLineSpacing: CGFloat = 0, sectionInset: UIEdgeInsets = .zero) {
        self.cellsPerRow = cellsPerRow
        super.init()
        
        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.minimumLineSpacing = minimumLineSpacing
        self.sectionInset = sectionInset
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        let marginsAndInsets = sectionInset.left + sectionInset.right + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
        itemSize = CGSize(width: itemWidth, height: itemWidth)
    }
    
    override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
        let context = super.invalidationContext(forBoundsChange: newBounds) as! UICollectionViewFlowLayoutInvalidationContext
        context.invalidateFlowLayoutDelegateMetrics = newBounds.size != collectionView?.bounds.size
        return context
    }
    
}

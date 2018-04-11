//
//  PageViewController.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-01-10.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
import UIKit
protocol NewPageObservation: class {
    func getParentPageViewController(parentRef: PageViewController)
}



class PageViewController: UIPageViewController {
    var orderedViewControllers: [UIViewController] = []
    //     lazy var orderedViewControllers: [UIViewController] = {
    //        return [UIStoryboard(name: "Main", bundle: nil) .
    //            instantiateViewController(withIdentifier: "ChildHomeVC"), UIStoryboard(name: "Main", bundle: nil) .
    //                instantiateViewController(withIdentifier: "ChildChatVC")]
    //    }()
    
    var currentIndex:Int {
        get {
            return orderedViewControllers.index(of: self.viewControllers!.first!)!
        }
        
        set {
            guard newValue >= 0,
                newValue < orderedViewControllers.count else {
                    return
            }
            
            let vc = orderedViewControllers[newValue]
            let direction:UIPageViewControllerNavigationDirection = newValue > currentIndex ? .forward : .reverse
            self.setViewControllers([vc], direction: direction, animated: true, completion: nil)
        }
    }
    
   
    func goToNextPage() {
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let nextViewController = dataSource?.pageViewController(self, viewControllerAfter: currentViewController) else { return }
        setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        let chatVC = orderedViewControllers[1] as! ChildChatViewController
//        chatVC.promptToAdd = promptType // This is to show the prompt for whatever button was tapped
//        chatVC.getPromptFrom(promptType: promptType)
        chatVC.changeto(showKeyboard: false)
        //        chatVC.test = "Worked"
        
        
        // make this change the current prompt in chatVC
        
        //        let test = 2
    }
    
    //    func goToNextPage(){
    //        print("Hit go to")
    //        //        guard let currentViewController = self.viewControllers?.first else { return }
    //        //
    //        //        guard let nextViewController = dataSource?.pageViewController( self, viewControllerAfter: currentViewController ) else { return }
    //        //
    //        //        setViewControllers([nextViewController], direction: .forward, animated: false, completion: nil)
    //        //
    //
    //        if let firstViewController = orderedViewControllers.first {
    //            setViewControllers([firstViewController],
    //                               direction: .forward,
    //                               animated: true,
    //                               completion: nil)
    //        }
    //    }
    
    func displayPageForIndex(index: Int, animated: Bool = true) {
        assert(index >= 0 && index < self.orderedViewControllers.count, "Error: Attempting to display a page for an out of bounds index")
        
        // nop if index == self.currentPageIndex
        if self.currentIndex == index { return }
        
        if index < self.currentIndex {
            self.setViewControllers([self.orderedViewControllers[index]], direction: .reverse, animated: true, completion: nil)
        } else if index > self.currentIndex {
            self.setViewControllers([self.orderedViewControllers[index]], direction: .forward, animated: true, completion: nil)
        }
        
        self.currentIndex = index
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        self.view.backgroundColor = getColourFor.appColour()
        
        let homeVC = UIStoryboard(name: "Main", bundle: nil) .instantiateViewController(withIdentifier: "ChildHomeVC")
        let chatVC =   UIStoryboard(name: "Main", bundle: nil) .instantiateViewController(withIdentifier: "ChildChatVC")
        let homeWithParent = homeVC as! NewPageObservation
        homeWithParent.getParentPageViewController(parentRef: self)
        orderedViewControllers.append(homeVC)
        
        let chatWithParent = chatVC as! NewPageObservation
        chatWithParent.getParentPageViewController(parentRef: self)
        orderedViewControllers.append(chatVC)
        delegate = self
        dataSource = self as UIPageViewControllerDataSource
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpView() {
        //        topBar = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        
//        behindChatBarBackground.backgroundColor = getColour.app.topBar()
//        behindChatBarBackground.layer.cornerRadius = 20
//        view.addSubview(behindChatBarBackground)
//        addbehindChatBarBackgroundConstraints()
//
//        chatBar.backgroundColor = getColour.app.chatBar()
//        chatBar.layer.cornerRadius = 20
//        chatBar.placeholder = "Tap to chat"
//        view.addSubview(chatBar)
//        addChatBarConstraints()
        
        ////        let testView = UIView(frame: CGRect(x: behindChatBarBackground.frame.maxX - 100, y: behindChatBarBackground.frame.minY, width: 100, height: 40))
        //        view.addSubview(testView)
        //        testViewConstraints()
        //        testView.backgroundColor = .black
        //        print(testView.frame)
        //        behindChatBarBackground.addSubview(testView)
    }
    
    
    
    
//    func addbehindChatBarBackgroundConstraints() {
//        behindChatBarBackground.translatesAutoresizingMaskIntoConstraints = false
//        //        behindChatBarBackground.backgroundColor = .white
//        //        behindChatBarGradient.alpha = 0.8
//
//        let heightConstraint = NSLayoutConstraint(item: behindChatBarBackground, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 40)
//        let leadingConstraint = NSLayoutConstraint(item: behindChatBarBackground, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 10)
//        let trailingConstraint = NSLayoutConstraint(item: behindChatBarBackground, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -10)
//        let bottomConstraint = NSLayoutConstraint(item: behindChatBarBackground, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -8)
//        view.addConstraints([heightConstraint, leadingConstraint, trailingConstraint, bottomConstraint])
//    }
//
//    func addChatBarConstraints() {
//        chatBar.translatesAutoresizingMaskIntoConstraints = false
//        let heightConstraint = NSLayoutConstraint(item: chatBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 40)
//        let leadingConstraint = NSLayoutConstraint(item: chatBar, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 20)
//        let trailingConstraint = NSLayoutConstraint(item: chatBar, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -20)
//        let bottomConstraint = NSLayoutConstraint(item: chatBar, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -8)
//        view.addConstraints([heightConstraint, leadingConstraint, trailingConstraint, bottomConstraint])
//    }
    
    //    func testViewConstraints() {
    //        testView.translatesAutoresizingMaskIntoConstraints = false
    //        let heightConstraint = NSLayoutConstraint(item: testView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 56)
    //        let leadingConstraint = NSLayoutConstraint(item: testView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
    //        let trailingConstraint = NSLayoutConstraint(item: testView, attribute: .trailing, relatedBy: .equal, toItem: behindChatBarBackground, attribute: .trailing, multiplier: 1.0, constant: 0)
    //        let bottomConstraint = NSLayoutConstraint(item: testView, attribute: .bottom, relatedBy: .equal, toItem: behindChatBarBackground, attribute: .bottom, multiplier: 1.0, constant: 0)
    //        view.addConstraints([heightConstraint, leadingConstraint, trailingConstraint, bottomConstraint])
    //    }
    
    
}

extension PageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        //        print(currentIndex)
        
        
        
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//                if currentIndex == 0 {
//                    titleLabel.text = "Home"
//                } else if currentIndex == 1 {
//                    titleLabel.text = "Chat"
//                }
    }
    
    
}

extension PageViewController: UIPageViewControllerDataSource {
    
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    
    
}

extension UIPageViewController {
    
    
    
    func goToPreviousPage(){
        
        guard let currentViewController = self.viewControllers?.first else { return }
        
        guard let previousViewController = dataSource?.pageViewController( self, viewControllerBefore: currentViewController ) else { return }
        
        setViewControllers([previousViewController], direction: .reverse, animated: false, completion: nil)
        
    }
    
}


//
//  OnboardingPageVC.swift
//  fasfu-demo-app
//
//  Created by Smith on 4/11/21.
//

import UIKit

protocol OnboardingViewDelegate: AnyObject {
    func numberOfPage(numberOfPage: Int)
    func pageChangedTo(index: Int)
}


class OnboardingPageVC: UIPageViewController {
    
    fileprivate var items: [UIViewController] = []
    
    //weak var viewDelegate: OnboardingViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        //delegate = self
        
        createPageControl()
        
        fillOnboardingItems()
        if let firstViewController = items.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        //viewDelegate?.numberOfPage(numberOfPage: items.count)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    func createPageControl() {
        //let index: Int = 0
        let pc = UIPageControl.appearance(whenContainedInInstancesOf: [OnboardingPageVC.self])
        //pc.backgroundColor = UIColor.yellow
        //pc.preferredIndicatorImage = #imageLiteral(resourceName: "gray-circle-symbol")
        pc.pageIndicatorTintColor = UIColor(named: "page-control-off")
        //pc.setIndicatorImage(#imageLiteral(resourceName: "blue-rectangle-symbol"), forPage: 0)
        pc.currentPageIndicatorTintColor = UIColor(named: "primary-color")
        //pc.currentPageIndicatorTintColor = UIColor(named: "primary-color")
        //pc.pageIndicatorTintColor = UIColor.systemGray2
        //view.addSubview(pc)
    }
    
    fileprivate func fillOnboardingItems() {
        
        defer {
            print("Ingreso a create el control \(items.count)")
            //createPageControl()
        }
        
        let descriptions = ["Nos une el amor por las hamburguesas, las risas con los amigos y las ganas de estar cerca siempre.", "Description for onboarding 2", "Description for onboarding 3"]
        
        for (index, d) in descriptions.enumerated() {
            print(index)
            let controller = createOnboardingItemController(with: d)
            items.append(controller)
        }
    }
    
    fileprivate func createOnboardingItemController(with descriptionText: String) -> UIViewController {
        let vc = UIViewController()
        vc.view = OnboardingItem(text: descriptionText)
        return vc
    }

}

extension OnboardingPageVC: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let viewControllerIndex = items.firstIndex(of: viewController) else {
            return nil
        }
                
        let previousIndex = viewControllerIndex - 1
        
        print("viewControllerBefore \(previousIndex)")
        
        guard previousIndex >= 0 else {
            return items.last
        }
        
        guard items.count > previousIndex else {
            return nil
        }
        
        return items[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = items.firstIndex(of: viewController) else {
            return nil
        }
                
        let nextIndex = viewControllerIndex + 1
        
        print("viewControllerAfter \(nextIndex)")
        
        guard items.count != nextIndex else {
            return items.first
        }
        
        guard items.count > nextIndex else {
            return nil
        }
        
        return items[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return items.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        print("presentationIndex")
        guard let firstViewController = viewControllers?.first,
              let firstViewControllerIndex = items.firstIndex(of: firstViewController) else {
            return 0
        }
        
        return firstViewControllerIndex
    }
    
}

/*
extension OnboardingPageVC: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        print("didFinishAnimating")
        
        if let currentVC = pageViewController.viewControllers?.first {
            let index = items.firstIndex(of: currentVC)!
            viewDelegate?.pageChangedTo(index: index)
        }
    
    }
}
*/

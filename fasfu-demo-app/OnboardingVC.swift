//
//  OnboardingViewController.swift
//  fasfu-demo-app
//
//  Created by Smith on 4/11/21.
//

import UIKit


class OnboardingVC: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var onboardingPage: OnboardingPageVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startButton.layer.cornerRadius = startButton.bounds.height / 2
        
//        pageControl.preferredIndicatorImage = #imageLiteral(resourceName: "gray-circle-symbol")
//        pageControl.pageIndicatorTintColor = UIColor(named: "page-control-off")
//        pageControl.setIndicatorImage(#imageLiteral(resourceName: "blue-rectangle-symbol"), forPage: 0)
//        pageControl.currentPageIndicatorTintColor = UIColor(named: "primary-color")
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? OnboardingPageVC {
            onboardingPage = vc
            onboardingPage.viewDelegate = self
        }
    }
    */
    @IBAction func startButtonPressed() { }
    
}
/*
extension OnboardingVC: OnboardingViewDelegate {
    
    func updatePageControlUI(currentPageIndex: Int) {
        pageControl.pageIndicatorTintColor = UIColor(named: "page-control-off")
        pageControl.currentPageIndicatorTintColor = UIColor(named: "primary-color")

        (0..<pageControl.numberOfPages).forEach { (index) in
            let activePageIconImage = #imageLiteral(resourceName: "blue-rectangle-symbol")
            let otherPageIconImage = #imageLiteral(resourceName: "gray-circle-symbol")
            let pageIcon = index == currentPageIndex ? activePageIconImage : otherPageIconImage
            pageControl.setIndicatorImage(pageIcon, forPage: index)
        }
    }
    
    func numberOfPage(numberOfPage: Int) {
        pageControl.numberOfPages = numberOfPage
    }
    
    func pageChangedTo(index: Int) {
        updatePageControlUI(currentPageIndex: index)
        pageControl.currentPage = index
    }
    
    
}
*/

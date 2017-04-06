//
//  ViewController.swift
//  Saffron-Official
//
//  Created by Aarnav Ram on 05/04/17.
//  Copyright © 2017 Aarnav Ram. All rights reserved.
//

import UIKit
import RazzleDazzle
import SCLAlertView

class ViewController: AnimatedPagingScrollViewController {
    
    private let launch = UIImageView(image: UIImage(named: "launchWithoutCenter"))
    private let logo = UIImageView(image: UIImage(named: "logoWithoutBG"))
    private let disclaimer = UIImageView(image: UIImage(named: "disclaimer"))
    private let firstPageClickView = UIImageView(image: UIImage(named: "transparent"))
    private let transparentView = UIImageView(image: UIImage(named: "transparent"))
    
    //create page control
    let pageControl: UIPageControl = {
        let control = UIPageControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.currentPage = 0
        control.pageIndicatorTintColor = UIColor.white
        control.currentPageIndicatorTintColor = UIColor.red
        return control
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = 2
        self.view.addSubview(pageControl)
        NSLayoutConstraint(item: pageControl, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: pageControl, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        
        // Do any additional setup after loading the view, typically from a nib.
        addViews()
        constrainLaunchImage()
        constrainLogo()
        constrainDisclaimer()
        constrainTrans()
        constrainFirstPageView()
        
        keepView(logo, onPages: [0,1])
        keepView(disclaimer, onPages: [1])
        keepView(launch, onPages: [0])
        keepView(firstPageClickView, onPages: [0])
        keepView(transparentView, onPages: [1])
        
        let gestureRec = UITapGestureRecognizer(target: self, action: #selector(goToApp))
        transparentView.isUserInteractionEnabled  = true
        transparentView.addGestureRecognizer(gestureRec)
        
        let gestureRec2 = UITapGestureRecognizer(target: self, action: #selector(slideWarning))
        firstPageClickView.isUserInteractionEnabled  = true
        firstPageClickView.addGestureRecognizer(gestureRec2)
        
        
        scaleAndHideLogo()
        configureScrollView()
        let animation = RotationAnimation(view: logo)
        animation[0] = 0
        animation[1] = 180
        animator.addAnimation(animation)
    }
    
    var page = 0
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        page = 0
        animator.animate(scrollView.contentOffset.x)
        let currentPage = Int(scrollView.contentOffset.x / pageWidth)
        page = currentPage
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        animator.animate(scrollView.contentOffset.x)
        let currentPage = Int(scrollView.contentOffset.x / pageWidth)
        if (page == 1 && currentPage == 1) {
            goToApp()
        }
        pageControl.currentPage = currentPage
        print(currentPage)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfPages() -> Int {
        return 2
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    func goToApp() {
        let appearance = SCLAlertView.SCLAppearance(kCircleHeight: 50, kCircleIconHeight: 50, showCircularIcon: true)
        let alertView = SCLAlertView(appearance: appearance)
        let alertViewIcon = UIImage(named: "logoWithoutBG") //Replace the IconImage text with the image name
        alertView.addButton("Yes", backgroundColor: UIColor.black, textColor: UIColor.white, showDurationStatus: false) {
            let userdefaults = UserDefaults.standard
            userdefaults.set("appPage", forKey: "vc")
            userdefaults.synchronize()
            self.performSegue(withIdentifier: "seg", sender: nil)
        }
        alertView.showTitle("Enter", subTitle: "Have you read the disclaimer?", duration: nil, completeText: "No", style: .warning, colorStyle: 0x000000, colorTextButton: 0xFFFFFF, circleIconImage: alertViewIcon, animationStyle: .rightToLeft)
    }
    
    func slideWarning() {
        let appearance = SCLAlertView.SCLAppearance(kCircleHeight: 50, kCircleIconHeight: 50, showCircularIcon: true)
        let alertView = SCLAlertView(appearance: appearance)
        let alertIcon = UIImage(named: "logoWithoutBG")
        alertView.showTitle("Slide Left", subTitle: "Please slide to the left to view the disclaimer", duration: 4, completeText: "OK", style: .warning, colorStyle: 0x000000, colorTextButton: 0xFFFFFF, circleIconImage: alertIcon, animationStyle: .rightToLeft)
    }
    
    
    
    func addViews() {
        contentView.addSubview(launch)
        contentView.addSubview(logo)
        contentView.addSubview(disclaimer)
        contentView.addSubview(transparentView)
        contentView.addSubview(firstPageClickView)
        contentView.bringSubview(toFront: logo)
    }
    
    
    func constrainLaunchImage() {
        NSLayoutConstraint(item: launch, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: -20).isActive = true
        NSLayoutConstraint(item: launch, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant:20).isActive = true
        NSLayoutConstraint(item: launch, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: launch, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1, constant: 0).isActive = true
    }
    
    func constrainLogo() {
        logo.widthAnchor.constraint(equalToConstant: 200).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 200).isActive = true
        logo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: logo, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: logo, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
    }
    
    func constrainDisclaimer() {
        NSLayoutConstraint(item: disclaimer, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: disclaimer, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailingMargin, multiplier: 1, constant:8).isActive = true
        NSLayoutConstraint(item: disclaimer, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: disclaimer, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1, constant: 0).isActive = true
    }
    
    func constrainTrans() {
        NSLayoutConstraint(item: transparentView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: transparentView, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailingMargin, multiplier: 1, constant:8).isActive = true
        NSLayoutConstraint(item: transparentView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: transparentView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1, constant: 0).isActive = true
    }
    
    func constrainFirstPageView() {
        NSLayoutConstraint(item: firstPageClickView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: -20).isActive = true
        NSLayoutConstraint(item: firstPageClickView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant:20).isActive = true
        NSLayoutConstraint(item: firstPageClickView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: firstPageClickView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1, constant: 0).isActive = true
    }
    
    func scaleAndHideLogo() {
        //Scale to big size
        let logoScaleAnimation = ScaleAnimation(view: logo)
        logoScaleAnimation.addKeyframe(0, value: 1, easing: EasingFunctionEaseInQuad)
        logoScaleAnimation[1] = 10
        animator.addAnimation(logoScaleAnimation)
        
        // Hide when we get to page 1
        let logoHideAnimation = HideAnimation(view: logo, hideAt: 0.5)
        animator.addAnimation(logoHideAnimation)
    }
    
    //keep the background color the same
    private func configureScrollView() {
        let backgroundColorAnimation = BackgroundColorAnimation(view: scrollView)
        backgroundColorAnimation[0] = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        backgroundColorAnimation[0.5] = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        backgroundColorAnimation[0.99] = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        backgroundColorAnimation[1] = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        animator.addAnimation(backgroundColorAnimation)
    }
    
}


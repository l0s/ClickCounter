//
//  ViewController.swift
//  ClickCounter
//
//  Created by Carlos Macasaet on 11/7/15.
//  Copyright (c) 2015 Carlos Macasaet. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

//    static let ratio:CGFloat = 1.6180339887498948482
//    static let inverseRatio:CGFloat = ratio - 1

    lazy var applicationFrame = UIScreen.mainScreen().applicationFrame

    // model
    var count = 0

    // view
    @IBOutlet var label:UILabel!

    @IBOutlet var incrementButton:UIButton!
    @IBOutlet var incrementButtonHorizontalPlacement:NSLayoutConstraint!

    @IBOutlet var decrementButton:UIButton!
    @IBOutlet var decrementButtonHorizontalPlacement:NSLayoutConstraint!

    override func loadView()
    {
        super.loadView()
        // According to the Apple Docs: "If you prefer to create views programmatically, instead of using a storyboard, you do so by overriding your view controller’s loadView method."
        // https://developer.apple.com/library/ios/featuredarticles/ViewControllerPGforiPhoneOS/ViewLoadingandUnloading/ViewLoadingandUnloading.html#//apple_ref/doc/uid/TP40007457-CH10-SW36

        view.setTranslatesAutoresizingMaskIntoConstraints( false )
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let swipeLeftRecogniser = UISwipeGestureRecognizer( target: self, action: "incrementCount" )
        swipeLeftRecogniser.direction = UISwipeGestureRecognizerDirection.Left
        view.addGestureRecognizer( swipeLeftRecogniser )

        let swipeRightRecogniser = UISwipeGestureRecognizer( target: self, action: "decrementCount" )
        swipeRightRecogniser.direction = UISwipeGestureRecognizerDirection.Right
        view.addGestureRecognizer( swipeRightRecogniser )
    }

    override func viewWillLayoutSubviews()
    {
        // view dimensions changed, update the constraints accordingly
        decrementButtonHorizontalPlacement.constant = view.frame.size.width / 3
        incrementButtonHorizontalPlacement.constant = view.frame.size.width * 2 / 3

        super.viewWillLayoutSubviews()
    }

    @IBAction func incrementCount()
    {
        label.text = "\(++count)"
    }

    @IBAction func decrementCount()
    {
        label.text = "\(--count)"
    }

}
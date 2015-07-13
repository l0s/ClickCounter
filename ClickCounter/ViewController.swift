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

    var incrementButton:UIButton!
    var incrementButtonHorizontalPlacement:NSLayoutConstraint!
    var incrementButtonVerticalPlacement:NSLayoutConstraint!

    @IBOutlet var decrementButton:UIButton!
    @IBOutlet var decrementButtonHorizontalPlacement:NSLayoutConstraint!

    override func loadView()
    {
        super.loadView()
        // According to the Apple Docs: "If you prefer to create views programmatically, instead of using a storyboard, you do so by overriding your view controller’s loadView method."
        // https://developer.apple.com/library/ios/featuredarticles/ViewControllerPGforiPhoneOS/ViewLoadingandUnloading/ViewLoadingandUnloading.html#//apple_ref/doc/uid/TP40007457-CH10-SW36

        view.setTranslatesAutoresizingMaskIntoConstraints( false )

        // increment button
        incrementButton = UIButton()
        incrementButton.setTranslatesAutoresizingMaskIntoConstraints( false )
        incrementButton.setTitle( "+", forState: .Normal )
        incrementButton.titleLabel?.font = UIFont.boldSystemFontOfSize( 48 )
        incrementButton.setTitleColor( UIColor.blueColor(), forState: .Normal )
        incrementButton.addTarget( self, action: "incrementCount", forControlEvents: .TouchUpInside )
        incrementButtonHorizontalPlacement = NSLayoutConstraint( item:incrementButton, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: -20 )
        incrementButtonVerticalPlacement = NSLayoutConstraint( item:incrementButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: -20 )

        // assembly
        view.addSubview( incrementButton )
        view.addConstraint( incrementButtonHorizontalPlacement )
        view.addConstraint( incrementButtonVerticalPlacement )
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
        incrementButtonHorizontalPlacement.constant = -view.frame.size.width / 3
        decrementButtonHorizontalPlacement.constant = view.frame.size.width / 3

        super.viewWillLayoutSubviews()
    }

    func incrementCount()
    {
        label.text = "\(++count)"
    }

    @IBAction func decrementCount()
    {
        label.text = "\(--count)"
    }

}
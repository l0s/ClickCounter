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

    // model
    var count = 0

    // view
    @IBOutlet var label:UILabel!

    @IBOutlet var incrementButton:UIButton!
    @IBOutlet var incrementButtonHorizontalPlacement:NSLayoutConstraint!

    @IBOutlet var decrementButton:UIButton!
    @IBOutlet var decrementButtonHorizontalPlacement:NSLayoutConstraint!

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
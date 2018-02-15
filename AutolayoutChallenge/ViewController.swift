//
//  ViewController.swift
//  AutolayoutChallenge
//
//  Created by Eduardo Vital Alencar Cunha on 03/07/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var switchHeight = false
    var constraintToSet = [NSLayoutConstraint]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .black

        let button = UIButton()
        let yellowView = UIView()
        let blueView = UIView()
        let redView = UIView()
        let grayView = UIView()

        button.translatesAutoresizingMaskIntoConstraints = false
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
        redView.translatesAutoresizingMaskIntoConstraints = false
        grayView.translatesAutoresizingMaskIntoConstraints = false

        button.setTitle("Alterar", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white

        yellowView.backgroundColor = .yellow
        blueView.backgroundColor = .blue
        redView.backgroundColor = .red
        grayView.backgroundColor = .gray

        self.view.addSubview(button)
        self.view.addSubview(yellowView)
        self.view.addSubview(blueView)
        self.view.addSubview(redView)
        self.view.addSubview(grayView)

        let views = [
            "button":button,
            "yellow":yellowView,
            "blue":blueView,
            "red":redView,
            "gray":grayView
        ]

        let firstRow = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[button(80)]-[yellow]-|", options: [], metrics: nil, views: views)
        let secondRow = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[blue]-|", options: [], metrics: nil, views: views)
        let thirdRow = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[red]-[gray(==red)]-|", options: [], metrics: nil, views: views)

        let vertical = NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[button(50)]-[blue]-[red(100@500)]-20-|", options: [], metrics: nil, views: views)

        let grayHeight = NSLayoutConstraint.constraints(withVisualFormat: "V:[gray(==red)]-20-|", options: [], metrics: nil, views: views)
        let yellowHeight = NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[yellow(==button)]", options: [], metrics: nil, views: views)

        NSLayoutConstraint.activate(
            firstRow +
            secondRow +
            thirdRow +
            vertical +
            grayHeight +
            yellowHeight
        )

        // Optional constaint
        self.constraintToSet = NSLayoutConstraint.constraints(withVisualFormat: "V:[red(200@750)]", options: [], metrics: nil, views: views)
        button.addTarget(self, action: #selector(self.changeHeight), for: .touchUpInside)
    }

    func changeHeight() {
        self.switchHeight = !self.switchHeight
        if self.switchHeight {
            NSLayoutConstraint.activate(self.constraintToSet)
        } else {
            NSLayoutConstraint.deactivate(self.constraintToSet)
        }
    }

}


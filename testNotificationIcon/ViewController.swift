//
//  ViewController.swift
//  testNotificationIcon
//
//  Created by James Tang on 20/5/2020.
//  Copyright © 2020 James Tang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var textField: UITextField!
    private let tapGestureRecognizer: UITapGestureRecognizer = .init()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        guard let item = self.tabBarController?.tabBarItem else { fatalError() }
        Swift.print("item \(item)")
        Swift.print("item \(self.tabBarItem)")
        self.tabBarItem.badgeValue = "1"
//        item.badgeValue = value

        stepper.addTarget(self, action: #selector(handleStepper(_:)), for: .valueChanged)
        textField.addTarget(self, action: #selector(handleTextFieldDidChange(_:)), for: .editingDidEnd)

        view.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer.addTarget(self, action: #selector(handleTap(_:)))
    }

    @IBAction func handleStepper(_ sender: Any) {
        let value = stepper.value > 0 ? "\(Int(stepper.value))": nil
        self.tabBarItem.badgeValue = value
    }

    @IBAction func handleTextFieldDidChange(_ sender: Any) {
        let value = textField.text
        self.tabBarItem.badgeValue = value
    }

    @IBAction func handleTap(_ sender: Any) {
        view.endEditing(true)
    }
}


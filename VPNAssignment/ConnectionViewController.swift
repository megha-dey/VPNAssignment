//
//  ProgressViewController.swift
//  VPNAssignment
//
//  Created by Vibha Kumari Dey on 21/03/25.
//

import UIKit

class ConnectionViewController: UIViewController {
    @IBOutlet weak var btnView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        btnView.clipsToBounds = true
        btnView.layer.cornerRadius = 10

    }

}

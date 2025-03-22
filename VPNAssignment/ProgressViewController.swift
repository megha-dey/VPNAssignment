//
//  ProgressViewController.swift
//  VPNAssignment
//
//  Created by Vibha Kumari Dey on 21/03/25.
//

import UIKit

class ProgressViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var successLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var statusView: UIView!


    override func viewDidLoad() {
        super.viewDidLoad()
        statusView.clipsToBounds = true
        statusView.layer.cornerRadius = 10
        successLabel.alpha = 0.0
        statusLabel.text = ""
        startLoading()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let curveHeight: CGFloat = 30

        let path = UIBezierPath()
        let width = backView.bounds.width
        let height = backView.bounds.height

        path.move(to: CGPoint(x: 0, y: curveHeight))
        path.addQuadCurve(to: CGPoint(x: width, y: curveHeight),
                          controlPoint: CGPoint(x: width / 2, y: -curveHeight))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.close()

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        backView.layer.mask = shapeLayer
    }
    
    private func startLoading() {
        let statusMessages = [
            "Ryn is finding the fastest server...",
            "Ryn hunting down the server...",
            "Server hunted down Successfully"
        ]
        for (index, message) in statusMessages.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index)) {
                self.statusLabel.text = message
                if index == statusMessages.count - 1 {
                    UIView.animate(withDuration: 0.5) {
                        self.successLabel.isHidden = false
                        self.progressView.isHidden = true
                        self.successLabel.alpha = 1.0
                    }
                }
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.goToSuccessScreen()
        }
    }
    
    private func goToSuccessScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let successVC = storyboard.instantiateViewController(withIdentifier: "ConnectionViewController") as? ConnectionViewController {
            successVC.modalTransitionStyle = .crossDissolve
            successVC.modalPresentationStyle = .fullScreen
            self.present(successVC, animated: true, completion: nil)
        }
    }    
}


//
//  ViewController.swift
//  VPNAssignment
//
//  Created by Vibha Kumari Dey on 21/03/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var btnView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        statusView.clipsToBounds = true
        statusView.layer.cornerRadius = 8
        btnView.clipsToBounds = true
        btnView.layer.cornerRadius = 5


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
    @IBAction func connectActionBtn(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let connectingVC = storyboard.instantiateViewController(withIdentifier: "ProgressViewController") as? ProgressViewController {
                connectingVC.modalTransitionStyle = .crossDissolve
                connectingVC.modalPresentationStyle = .fullScreen
                self.present(connectingVC, animated: true, completion: nil)
            }
        }        
    }
}


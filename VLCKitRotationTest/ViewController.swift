//
//  ViewController.swift
//  VLCKitRotationTest
//
//  Created by Marcel Müller on 05.03.23.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var orientationLabel: UILabel!
    @IBOutlet weak var motionLabel: UILabel!

    private var motionManager = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.updateLabel()
        }

        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.1

            let queue = OperationQueue()
            motionManager.startDeviceMotionUpdates(to: queue, withHandler: { motion, error in
                if let attitude = motion?.attitude {
                    DispatchQueue.main.async {
                        var yaw = String(format: "%.0f", attitude.yaw * 180.0 / Double.pi)
                        var roll = String(format: "%.0f", attitude.roll * 180.0 / Double.pi)
                        var pitch = String(format: "%.0f", attitude.pitch * 180.0 / Double.pi)

                        self.motionLabel.text = "Yaw: \(yaw) | Roll: \(roll) | Ptich: \(pitch)"
                    }
                }

            })
        }
    }

    private func updateLabel() {
        var text = ""

        switch UIDevice.current.orientation {
        case .portrait:
            text = "Portrait"
        case .portraitUpsideDown:
            text = "PortraitUpsideDown"
        case .landscapeLeft:
            text = "LandscapeLeft"
        case .landscapeRight:
            text = "LandscapeRight"
        default:
            text = "Unknown"
        }

        orientationLabel.text = text
    }

    @IBAction func openDialogTouchUpInside(_ sender: Any) {
        let vc = UIViewController()
        self.present(vc, animated: true, completion: nil)
    }
}


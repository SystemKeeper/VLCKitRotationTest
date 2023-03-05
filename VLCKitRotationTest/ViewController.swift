//
//  ViewController.swift
//  VLCKitRotationTest
//
//  Created by Marcel Müller on 05.03.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            self.updateLabel()
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

        helloLabel.text = text
    }

    @IBAction func openDialogTouchUpInside(_ sender: Any) {
        let vc = UIViewController()
        self.present(vc, animated: true, completion: nil)
    }
}


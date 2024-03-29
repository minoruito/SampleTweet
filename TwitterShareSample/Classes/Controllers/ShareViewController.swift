//
//  ShareViewController.swift
//  TwitterShareSample
//
//  Created by Naoto Onagi on 2017/08/31.
//  Copyright © 2017 Naoto Onagi All rights reserved.
//

import UIKit

final class ShareViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func shareWithTwitterKit(_ sender: Any) {
        Twitters.shared.share(text: "Sample Text", on: self) { result in
            switch result {
            case .cancelled: break
            case .done: break
            case .failure(_): break
            }
        }
    }

    @IBAction func directURL(_ sender: Any) {
        let url = URL(string: "twitter://post?message=hello%20world")
        UIApplication.shared.open(url!, options: [:], completionHandler: { (success) in
            print("Open url : \(success)")
        })
    }

    @IBAction func logout(_ sender: Any) {
        Twitters.shared.logoutAllUsers()
    }
}

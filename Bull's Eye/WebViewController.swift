//
//  WebViewController.swift
//  Bull's Eye
//
//  Created by Sabbir on 1/5/19.
//  Copyright © 2019 Sabbir. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html"){
            if let htmlData = try? Data(contentsOf: url) {
                let baseURL = URL(fileURLWithPath: Bundle.main.bundlePath)
                webView.load(htmlData, mimeType: "text/html", textEncodingName: "UFT-8", baseURL: baseURL)
            }
        }
    }
    
    
    
    

    @IBAction func Close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}

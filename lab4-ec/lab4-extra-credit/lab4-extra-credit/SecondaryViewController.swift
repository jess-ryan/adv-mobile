//
//  SecondaryViewController.swift
//  lab4-extra-credit
//
//  Created by Jess Ryan on 4/30/22.
//

import UIKit
import WebKit

class SecondaryViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var webActivityIndicator: UIActivityIndicatorView!
    var webpage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        loadWebPage("https://www.nytimes.com/books/best-sellers/")
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let url = webpage {
            loadWebPage(url)
        }
    }
        
    func loadWebPage(_ urlString: String){
        
        let myurl = URL(string: urlString)
        let request = URLRequest(url: myurl!)
        webView.load(request)
    }

    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webActivityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        webActivityIndicator.startAnimating()
    }

}

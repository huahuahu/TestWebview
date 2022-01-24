//
//  ViewController.swift
//  TestWebView
//
//  Created by tigerguo on 2021/12/7.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(webView)

        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        webView.navigationDelegate = self
        configBridge()
        webView.loadHTMLString(getHtml(), baseURL: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(triggerJSFunction))
    }

    private func getHtml() -> String {
        let url = Bundle.main.url(forResource: "index", withExtension: "html")!
        let string = try! String(contentsOf: url)
        return string
    }

    private func configBridge() {
        webView.configuration.userContentController.add(ScriptHandler(), name: "test")
    }

    @objc private func triggerJSFunction() {
        print("\(#function)")
        let js = "window.testSendToNative()"
        webView.evaluateJavaScript(js) { result, err in
            print("eval \(result), \(err)")
        }
    }

}

extension ViewController: WKNavigationDelegate {
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        print("\(#function)")
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("\(#function)")
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("\(#function)")
    }
}

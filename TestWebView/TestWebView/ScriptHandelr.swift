//
//  ScriptHandelr.swift
//  TestWebView
//
//  Created by tigerguo on 2022/1/24.
//

import Foundation
import WebKit

class ScriptHandler:NSObject, WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("receive message \(message.name), \(message.body)")

    }

}

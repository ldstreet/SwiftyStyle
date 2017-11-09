//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import SwiftyStyle

PlistStyleStrategy.plistStyleStrategyInfo.defaultPlistName = "StyleMap"

class LSButton: UIButton, Stylable {
    var styleInfo = StyleInfo()
    typealias Strategy = PlistStyleStrategy
}

let button = LSButton()
button.styleKey = "StyleOne"
button.setTitle("hello world!", for: .normal)
button.frame = CGRect(x: 0.0, y: 0.0, width: 200, height: 75)

let vc = UIViewController()
vc.view.backgroundColor = .white
vc.view.addSubview(button)

PlaygroundPage.current.liveView = vc

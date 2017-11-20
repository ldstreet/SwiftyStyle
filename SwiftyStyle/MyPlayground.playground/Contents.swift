//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import SwiftyStyle

typealias PlistStrategy = PlistStyleStrategy<HexColorSet, PreferredFontSet>

PlistStrategy.setPlist(forType: StylePlistType.defaultPlist, plistName: "StyleMap")

class LSButton: UIButton, Stylable {

    var styleInfo = StyleInfo()
    typealias Strategy = PlistStrategy
}



let button = LSButton()
button.styleKey = "StyleOne"

button.setTitle("hello world!", for: .normal)
button.frame = CGRect(x: 10.0, y: 10.0, width: 200, height: 75)

let vc = UIViewController()
vc.view.backgroundColor = .white
vc.view.addSubview(button)

PlaygroundPage.current.liveView = button



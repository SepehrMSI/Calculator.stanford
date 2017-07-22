//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func changeSign(operand: Double) -> Double {
    return -operand
}

var f: (Double) -> Double
f = changeSign
let x = f(81)




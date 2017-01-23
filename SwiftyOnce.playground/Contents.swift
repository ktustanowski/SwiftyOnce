//: Playground - noun: a place where people can play

import UIKit
import SwiftyOnce


let concurrentQueue = DispatchQueue(label: "concurrent.queue", qos: .utility, attributes: .concurrent)

for _ in 0...100 {
    
    DispatchQueue.global().async {
        Once.dispatch(withToken:"someToken") {
            print("You should see this only once")
        }
    }

    concurrentQueue.async {
        for _ in 0...100 {
            Once.dispatch(withToken:"someToken") {
                print("You should see this only once")
            }
        }
    }

}

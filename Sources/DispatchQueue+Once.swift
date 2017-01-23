//  MIT License
//
//  Copyright (c) 2017 ktustanowski
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.//
//  DispatchQueue+Once.swift
//  SwiftyOnce
//
//  Created by Kamil Tustanowski on 20.01.2017.
//  Copyright © 2017 ktustanowski. All rights reserved.
//

import Foundation

public extension DispatchQueue {
    fileprivate static var tokens = [String]()
    
    public class func once(token: String, block:(Void)->Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        guard !tokens.contains(token) else { return }
        
        tokens.append(token)
        block()
    }
}

extension DispatchQueue {
    
    /// Only for unit testing purposes. Removes once token. This allows another execution of closure assiciated with this token.
    ///
    /// - Warning: This behavior is allowed only for schemes which have set IN_TESTS environmental variable.
    static func remove(onceToken: String) {
        guard ProcessInfo.processInfo.environment["IN_TESTS"] != nil else {
            assertionFailure("Can't remove once tokens while not in tests!")
            return
        }
        guard let index = tokens.index(of: onceToken) else { return }
        
        tokens.remove(at: index)
    }
}

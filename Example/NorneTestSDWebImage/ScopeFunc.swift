//
//  ScopeFunc.swift
//  NorneTestSDWebImage_Example
//
//  Created by NoRne on 2023/2/24.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

@inline(__always) func run<R>(block: () -> R) -> R {
  block()
}

public protocol ScopeFunc {}
public extension ScopeFunc {
  @inline(__always) func `let`<R>(block: (Self) -> R) -> R {
    block(self)
  }

  @inline(__always) func also(block: (Self) -> Void) -> Self {
    block(self)
    return self
  }

  @inline(__always) func takeIf(predicate: (Self) -> Bool) -> Self? {
    if predicate(self) {
      return self
    } else {
      return nil
    }
  }

  @inline(__always) func takeUnless(predicate: (Self) -> Bool) -> Self? {
    if !predicate(self) {
      return self
    } else {
      return nil
    }
  }

  @inline(__always) func `repeat`(times: Int, action: (Int) -> Void) {
    for index in 0 ... times - 1 {
      action(index)
    }
  }
}

extension NSObject: ScopeFunc {}

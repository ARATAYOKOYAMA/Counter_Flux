//
//  Injectable.swift
//  Counter_Flux
//
//  Created by 横山新 on 2019/04/07.
//  Copyright © 2019 ARATAYOKOYAMA. All rights reserved.
//

import UIKit

protocol Injectable {
    associatedtype Dependency
    init(with dependency: Dependency)
}

extension Injectable where Dependency == Void {
    init() {
        self.init(with: ())
    }
}

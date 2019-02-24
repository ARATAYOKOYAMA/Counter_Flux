//
//  ActionCreator.swift
//  Counter_Flux
//
//  Created by 横山新 on 2019/02/21.
//  Copyright © 2019 ARATAYOKOYAMA. All rights reserved.
//

import Foundation

protocol ActionCreator {
    var dispatcher: Dispatcher { get }
    init(with dispatcher: Dispatcher)
}

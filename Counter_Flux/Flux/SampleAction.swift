//
//  SampleAction.swift
//  Counter_Flux
//
//  Created by 横山新 on 2019/02/13.
//  Copyright © 2019 ARATAYOKOYAMA. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

enum CountAction: Action {
    case plussButtonDidtap(Int)
    case minusButtonDidtap(Int)
}

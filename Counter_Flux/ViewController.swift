//
//  ViewController.swift
//  Counter_Flux
//
//  Created by 横山新 on 2019/02/13.
//  Copyright © 2019 ARATAYOKOYAMA. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var PlusButton: UIButton!
    @IBOutlet private weak var MinusButton: UIButton!
    private let viewModel = CountViewModel()
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addrxObserber()
    }
    
    private func addrxObserber() {
        PlusButton.rx.tap
            .bind(to: viewModel.plussButtonDidTap)
            .disposed(by: disposeBag)
        
        MinusButton.rx.tap
            .bind(to: viewModel.minusButtonDidTap)
            .disposed(by: disposeBag)
        
        viewModel.count
            .bind(onNext: { [weak self] count in
                self?.label.text = String(count)
            })
            .disposed(by: disposeBag)
    }


}


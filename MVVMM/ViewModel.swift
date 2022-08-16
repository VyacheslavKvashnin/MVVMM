//
//  ViewModel.swift
//  MVVMM
//
//  Created by Вячеслав Квашнин on 16.08.2022.
//

import Foundation

class ViewModel {
    
    var didChangeValue: ((ViewModel) -> Void)?
    
    var name: Observable<String> = Observable("Joy")
    
    var value: String {
        didSet {
            didChangeValue?(self)
        }
    }
    
    init(value: String? = nil, name: String? = "nil") {
        self.value = value ?? ""
        self.name.value = name ?? ""
    }
    
    func showData() {
        self.value = "New"
        self.name.value = "Name"
    }
}

//
//  ViewController.swift
//  MVVMM
//
//  Created by Вячеслав Квашнин on 16.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lab: UILabel!
    @IBOutlet weak var lab2: UILabel!
    
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setChange()
    }
    
    private func setChange() {
        viewModel?.didChangeValue = { [unowned self] viewModel in
            self.lab.text = viewModel.value
        }
        
        viewModel.name.bind { name in
            self.lab2.text = name
        }
    }

    @IBAction func button(_ sender: Any) {
        viewModel?.showData()
    }
}

extension ViewController {
    static func instantiate(storyboardName: String = "Main") -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateInitialViewController() as! Self
    }
}

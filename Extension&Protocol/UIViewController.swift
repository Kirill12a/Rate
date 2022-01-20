//
//  UIViewController.swift
//  Rate
//
//  Created by Kirill Drozdov on 19.01.2022.
//

import UIKit

extension UIViewController
{
    func setupHideKeyboardOnTap()
  {
        self.view.addGestureRecognizer(self.endEditingRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
    }


    private func endEditingRecognizer() -> UIGestureRecognizer
  {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
}

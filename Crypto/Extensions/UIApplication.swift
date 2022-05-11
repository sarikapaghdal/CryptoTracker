//
//  UIApplication.swift
//  Crypto
//
//  Created by Sarika on 11.05.22.
//

import Foundation
import SwiftUI

//to dismiss the keyboard when user click on the xmark button

extension UIApplication {
    
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

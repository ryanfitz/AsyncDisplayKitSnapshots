//
//  ViewModel.swift
//  AsyncDisplayKitSnapshots
//
//  Created by Ryan Fitzgerald on 1/24/17.
//  Copyright © 2017 Ryan Fitzgerald. All rights reserved.
//

import Foundation

class ViewModel {
  var username: String?

  var isUsernameValid: Bool {
    guard let name = username else { return false }

    return !name.isEmpty
  }
}

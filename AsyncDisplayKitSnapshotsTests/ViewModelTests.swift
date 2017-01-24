//
//  ViewModelTests.swift
//  AsyncDisplayKitSnapshots
//
//  Created by Ryan Fitzgerald on 1/24/17.
//  Copyright © 2017 Ryan Fitzgerald. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import AsyncDisplayKitSnapshots
class ViewModelSpec: QuickSpec {
  override func spec() {

    var subject: ViewModel!

    fdescribe("username") {
      it("is not valid when not set") {
        subject = ViewModel()
        expect(subject.isUsernameValid).to(beFalse())
      }

      it("is not valid when empty") {
        subject = ViewModel()
        subject.username = ""
        expect(subject.isUsernameValid).to(beFalse())
      }

      it("is valid") {
        subject = ViewModel()
        subject.username = "foobar"
        expect(subject.isUsernameValid).to(beTrue())
      }
    }
  }
}

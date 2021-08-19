//
//  UpdateStore.swift
//  Coder
//
//  Created by Zivai Kanengomi on 2021/08/17.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}


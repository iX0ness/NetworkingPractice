//
//  DebugPrint.swift
//  NetworkingPractice
//
//  Created by Levchuk Misha on 11/08/2020.
//  Copyright © 2020 Levchuk Misha. All rights reserved.
//

import Foundation

func debugFailure(items: Any) {
    print("❌ FAILURE ❌")
    debugPrint(items)
}

func debugSuccess(items: Any) {
    print("✅ SUCCESS ✅")
    debugPrint(items)
}

func debugInfo(items: Any) {
    print("ℹ️ INFO ℹ️")
    debugPrint(items)
}

//
//  ARManager.swift
//  YT
//
//  Created by Norah W on 20/05/1445 AH.
//

// Created by Florian Schweizer on 20.06.22

import Combine

class ARManager {
    static let shared = ARManager()
    private init() { }
    
    var actionStream = PassthroughSubject<ARAction, Never>()
}


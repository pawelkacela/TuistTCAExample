//
//  PageDTO.swift
//  Onboarding
//
//  Created by Pawel Kacela on 27/03/2026.
//

import Foundation

public struct PageDTO: Equatable, Identifiable {
    public let id: UUID
    public let title: String?
    public let description: String?
}

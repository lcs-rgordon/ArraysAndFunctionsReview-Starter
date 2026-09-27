//
//  Song.swift
//  RoadTripPlaylist
//

import Foundation

// MODEL
struct Song: Identifiable {

    // MARK: - Stored properties

    // Each song gets its own identifier, so SwiftUI can tell songs apart
    let id: UUID = UUID()

    var title: String
    var artist: String
    var lengthInSeconds: Int
    var beatsPerMinute: Int
    var timesPlayed: Int

    // MARK: - Computed properties

    // For example, 205 seconds is shown as "3:25"
    var lengthDescription: String {
        return timeDescription(forSeconds: lengthInSeconds)
    }

}

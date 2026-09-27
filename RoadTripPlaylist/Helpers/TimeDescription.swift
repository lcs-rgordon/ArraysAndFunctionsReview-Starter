//
//  TimeDescription.swift
//  RoadTripPlaylist
//

import Foundation

// Turns a number of seconds into minutes and seconds.
// For example, 205 becomes "3:25" and 60 becomes "1:00".
func timeDescription(forSeconds totalSeconds: Int) -> String {
    let minutes: Int = totalSeconds / 60
    let seconds: Int = totalSeconds % 60

    // Seconds always show two digits, so 5 seconds is "05"
    if seconds < 10 {
        return "\(minutes):0\(seconds)"
    } else {
        return "\(minutes):\(seconds)"
    }
}

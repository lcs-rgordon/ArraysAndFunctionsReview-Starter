//
//  TestSongs.swift
//  RoadTripPlaylistTests
//

@testable import RoadTripPlaylist

// A small, fixed playlist for the tests, with numbers that are easy to add up.
//
//  index  title          artist            length  bpm  played
//    0    Open Road      Lake Effect         200   128     0
//    1    Night Bus      Northern Static     150    95     2
//    2    Slow Thaw      Lake Effect         240    72     1
//    3    Signal Fire    Juniper Vale        175   140     0
//
//  Total length: 200 + 150 + 240 + 175 = 765 seconds
@MainActor
func makeTestSongs() -> [Song] {
    let testSongs: [Song] = [
        Song(title: "Open Road", artist: "Lake Effect", lengthInSeconds: 200, beatsPerMinute: 128, timesPlayed: 0),
        Song(title: "Night Bus", artist: "Northern Static", lengthInSeconds: 150, beatsPerMinute: 95, timesPlayed: 2),
        Song(title: "Slow Thaw", artist: "Lake Effect", lengthInSeconds: 240, beatsPerMinute: 72, timesPlayed: 1),
        Song(title: "Signal Fire", artist: "Juniper Vale", lengthInSeconds: 175, beatsPerMinute: 140, timesPlayed: 0),
    ]
    return testSongs
}

// Makes one song with only the details a test cares about.
@MainActor
func makeSong(title: String = "Test Song", artist: String = "Test Artist", lengthInSeconds: Int = 180, beatsPerMinute: Int = 100) -> Song {
    return Song(title: title, artist: artist, lengthInSeconds: lengthInSeconds, beatsPerMinute: beatsPerMinute, timesPlayed: 0)
}

// Lists the titles of some songs, in order, so a test can compare them easily.
@MainActor
func titles(of someSongs: [Song]) -> [String] {
    var songTitles: [String] = []
    for song in someSongs {
        songTitles.append(song.title)
    }
    return songTitles
}

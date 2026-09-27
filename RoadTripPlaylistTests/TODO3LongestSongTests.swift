//
//  TODO3LongestSongTests.swift
//  RoadTripPlaylistTests
//

import Testing
@testable import RoadTripPlaylist

@MainActor
@Suite("TODO 3: longestSongTitle()")
struct TODO3LongestSongTests {

    // MARK: - Functions

    @Test("Finds the longest song in the middle of the playlist")
    func longestInMiddle() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        #expect(viewModel.longestSongTitle() == "Slow Thaw")
    }

    @Test("Finds the longest song when it is the first song (index 0)")
    func longestIsFirst() {
        let someSongs: [Song] = [
            makeSong(title: "First", lengthInSeconds: 300),
            makeSong(title: "Second", lengthInSeconds: 100),
            makeSong(title: "Third", lengthInSeconds: 200),
        ]
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: someSongs)
        #expect(viewModel.longestSongTitle() == "First")
    }

    @Test("Finds the longest song when it is the last song")
    func longestIsLast() {
        let someSongs: [Song] = [
            makeSong(title: "First", lengthInSeconds: 100),
            makeSong(title: "Second", lengthInSeconds: 200),
            makeSong(title: "Third", lengthInSeconds: 300),
        ]
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: someSongs)
        #expect(viewModel.longestSongTitle() == "Third")
    }

    @Test("A playlist with one song: that song is the longest")
    func oneSong() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: [makeSong(title: "Only One", lengthInSeconds: 90)])
        #expect(viewModel.longestSongTitle() == "Only One")
    }

    @Test("Requirement: when songs tie for longest, the one that comes first wins")
    func tieGoesToFirst() {
        let someSongs: [Song] = [
            makeSong(title: "Short", lengthInSeconds: 100),
            makeSong(title: "Tied Early", lengthInSeconds: 250),
            makeSong(title: "Tied Late", lengthInSeconds: 250),
        ]
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: someSongs)
        #expect(viewModel.longestSongTitle() == "Tied Early")
    }

    @Test("Requirement: an empty playlist gives \"No songs yet\"")
    func emptyPlaylist() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: [])
        #expect(viewModel.longestSongTitle() == "No songs yet")
    }

}

//
//  TODO7MarkAsPlayedTests.swift
//  RoadTripPlaylistTests
//

import Testing
@testable import RoadTripPlaylist

@MainActor
@Suite("TODO 7: markAsPlayed(at:)")
struct TODO7MarkAsPlayedTests {

    // MARK: - Functions

    @Test("Adds 1 to the times played of the song at that index, and only that song")
    func marksMiddleSong() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        let wasMarked: Bool = viewModel.markAsPlayed(at: 1)
        #expect(wasMarked == true)
        #expect(viewModel.songs[1].timesPlayed == 3)
        #expect(viewModel.songs[0].timesPlayed == 0)
        #expect(viewModel.songs[2].timesPlayed == 1)
    }

    @Test("Works on the first song (index 0)")
    func marksFirstSong() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        let wasMarked: Bool = viewModel.markAsPlayed(at: 0)
        #expect(wasMarked == true)
        #expect(viewModel.songs[0].timesPlayed == 1)
    }

    @Test("Works on the last song (index count - 1)")
    func marksLastSong() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        let wasMarked: Bool = viewModel.markAsPlayed(at: 3)
        #expect(wasMarked == true)
        #expect(viewModel.songs[3].timesPlayed == 1)
    }

    @Test("Playing the same song twice adds 2")
    func marksTwice() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        let firstTime: Bool = viewModel.markAsPlayed(at: 2)
        let secondTime: Bool = viewModel.markAsPlayed(at: 2)
        #expect(firstTime == true)
        #expect(secondTime == true)
        #expect(viewModel.songs[2].timesPlayed == 3)
    }

    @Test("Out of range: index equal to the number of songs changes nothing and returns false")
    func indexEqualToCount() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        let wasMarked: Bool = viewModel.markAsPlayed(at: 4)
        #expect(wasMarked == false)
        #expect(viewModel.songs[3].timesPlayed == 0)
    }

    @Test("Out of range: index -1 (\"not found\") returns false")
    func negativeIndex() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        #expect(viewModel.markAsPlayed(at: -1) == false)
    }

    @Test("An empty playlist has no index 0, so it returns false")
    func emptyPlaylist() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: [])
        #expect(viewModel.markAsPlayed(at: 0) == false)
    }

}

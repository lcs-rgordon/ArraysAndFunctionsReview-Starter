//
//  TODO1TotalLengthTests.swift
//  RoadTripPlaylistTests
//

import Testing
@testable import RoadTripPlaylist

@MainActor
@Suite("TODO 1: totalLengthInSeconds()")
struct TODO1TotalLengthTests {

    // MARK: - Functions

    @Test("Adds up the length of every song")
    func addsUpEverySong() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        #expect(viewModel.totalLengthInSeconds() == 765)
    }

    @Test("A playlist with one song is as long as that song")
    func oneSong() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: [makeSong(lengthInSeconds: 213)])
        #expect(viewModel.totalLengthInSeconds() == 213)
    }

    @Test("An empty playlist has a total length of 0")
    func emptyPlaylist() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: [])
        #expect(viewModel.totalLengthInSeconds() == 0)
    }

}

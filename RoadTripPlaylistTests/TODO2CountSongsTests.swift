//
//  TODO2CountSongsTests.swift
//  RoadTripPlaylistTests
//

import Testing
@testable import RoadTripPlaylist

@MainActor
@Suite("TODO 2: countSongs(by:)")
struct TODO2CountSongsTests {

    // MARK: - Functions

    @Test("Counts the songs by an artist with more than one song")
    func artistWithTwoSongs() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        #expect(viewModel.countSongs(by: "Lake Effect") == 2)
    }

    @Test("Counts an artist whose only song is the last one in the list")
    func artistWithLastSong() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        #expect(viewModel.countSongs(by: "Juniper Vale") == 1)
    }

    @Test("Counts every song when every song is by the same artist")
    func everySongBySameArtist() {
        let sameArtist: [Song] = [makeSong(artist: "Solo"), makeSong(artist: "Solo"), makeSong(artist: "Solo")]
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: sameArtist)
        #expect(viewModel.countSongs(by: "Solo") == 3)
    }

    @Test("Returns 0 for an artist who is not in the playlist")
    func artistNotInPlaylist() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        #expect(viewModel.countSongs(by: "Nobody") == 0)
    }

    @Test("Requirement: the name must match exactly, so \"lake effect\" is not \"Lake Effect\"")
    func nameMustMatchExactly() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        #expect(viewModel.countSongs(by: "lake effect") == 0)
    }

    @Test("Returns 0 for an empty playlist")
    func emptyPlaylist() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: [])
        #expect(viewModel.countSongs(by: "Lake Effect") == 0)
    }

}

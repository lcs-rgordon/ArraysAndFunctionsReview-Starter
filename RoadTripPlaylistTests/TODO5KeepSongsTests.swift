//
//  TODO5KeepSongsTests.swift
//  RoadTripPlaylistTests
//

import Testing
@testable import RoadTripPlaylist

@MainActor
@Suite("TODO 5: keepSongs(by:shorterThan:)")
struct TODO5KeepSongsTests {

    // MARK: - Functions

    @Test("Keeps only the songs by the artist that are short enough")
    func keepsShortSongsByArtist() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        let keptSongs: [Song] = viewModel.keepSongs(by: "Lake Effect", shorterThan: 220)
        #expect(titles(of: keptSongs) == ["Open Road"])
    }

    @Test("Keeps every song by the artist, in playlist order, when the limit is long")
    func keepsAllInOrder() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        let keptSongs: [Song] = viewModel.keepSongs(by: "Lake Effect", shorterThan: 1000)
        #expect(titles(of: keptSongs) == ["Open Road", "Slow Thaw"])
    }

    @Test("Requirement: a song exactly as long as the limit is not kept")
    func exactLengthIsNotKept() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        let keptSongs: [Song] = viewModel.keepSongs(by: "Lake Effect", shorterThan: 200)
        #expect(keptSongs.count == 0)
    }

    @Test("Both parameters matter: a short song by a different artist is not kept")
    func bothParametersMatter() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        let keptSongs: [Song] = viewModel.keepSongs(by: "Northern Static", shorterThan: 1000)
        #expect(titles(of: keptSongs) == ["Night Bus"])
    }

    @Test("Finds a match in the last position of the playlist")
    func matchInLastPosition() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        let keptSongs: [Song] = viewModel.keepSongs(by: "Juniper Vale", shorterThan: 176)
        #expect(titles(of: keptSongs) == ["Signal Fire"])
    }

    @Test("Returns an empty list for an artist who is not in the playlist")
    func artistNotInPlaylist() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        let keptSongs: [Song] = viewModel.keepSongs(by: "Nobody", shorterThan: 1000)
        #expect(keptSongs.count == 0)
    }

    @Test("Returns an empty list for an empty playlist")
    func emptyPlaylist() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: [])
        let keptSongs: [Song] = viewModel.keepSongs(by: "Lake Effect", shorterThan: 1000)
        #expect(keptSongs.count == 0)
    }

    @Test("Requirement: the playlist itself does not change")
    func playlistUnchanged() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        let keptSongs: [Song] = viewModel.keepSongs(by: "Lake Effect", shorterThan: 220)
        #expect(keptSongs.count == 1)
        #expect(viewModel.songs.count == 4)
    }

}

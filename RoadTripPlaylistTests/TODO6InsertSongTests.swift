//
//  TODO6InsertSongTests.swift
//  RoadTripPlaylistTests
//

import Testing
@testable import RoadTripPlaylist

@MainActor
@Suite("TODO 6: insertSong(_:at:)")
struct TODO6InsertSongTests {

    // MARK: - Functions

    @Test("Index 0 puts the new song at the top")
    func insertAtTop() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        let wasInserted: Bool = viewModel.insertSong(makeSong(title: "New"), at: 0)
        #expect(wasInserted == true)
        #expect(titles(of: viewModel.songs) == ["New", "Open Road", "Night Bus", "Slow Thaw", "Signal Fire"])
    }

    @Test("An index in the middle moves the later songs down one place")
    func insertInMiddle() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        let wasInserted: Bool = viewModel.insertSong(makeSong(title: "New"), at: 2)
        #expect(wasInserted == true)
        #expect(titles(of: viewModel.songs) == ["Open Road", "Night Bus", "New", "Slow Thaw", "Signal Fire"])
    }

    @Test("Requirement: an index equal to the number of songs puts the new song at the end")
    func insertAtEnd() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        let wasInserted: Bool = viewModel.insertSong(makeSong(title: "New"), at: 4)
        #expect(wasInserted == true)
        #expect(titles(of: viewModel.songs) == ["Open Road", "Night Bus", "Slow Thaw", "Signal Fire", "New"])
    }

    @Test("A song can be inserted into an empty playlist at index 0")
    func insertIntoEmpty() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: [])
        let wasInserted: Bool = viewModel.insertSong(makeSong(title: "New"), at: 0)
        #expect(wasInserted == true)
        #expect(titles(of: viewModel.songs) == ["New"])
    }

    @Test("Out of range: index -1 changes nothing and returns false")
    func negativeIndex() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        let wasInserted: Bool = viewModel.insertSong(makeSong(title: "New"), at: -1)
        #expect(wasInserted == false)
        #expect(viewModel.songs.count == 4)
    }

    @Test("Out of range: one past the end changes nothing and returns false")
    func onePastTheEnd() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: makeTestSongs())
        let wasInserted: Bool = viewModel.insertSong(makeSong(title: "New"), at: 5)
        #expect(wasInserted == false)
        #expect(viewModel.songs.count == 4)
    }

}

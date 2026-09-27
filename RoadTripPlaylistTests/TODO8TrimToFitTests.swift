//
//  TODO8TrimToFitTests.swift
//  RoadTripPlaylistTests
//

import Testing
@testable import RoadTripPlaylist

@MainActor
@Suite("TODO 8: trimToFit(minutes:)")
struct TODO8TrimToFitTests {

    // MARK: - Functions

    // Three songs: 2 minutes, 3 minutes and 4 minutes, so 9 minutes in all.
    func makeNineMinutePlaylist() -> PlaylistViewModel {
        let someSongs: [Song] = [
            makeSong(title: "Two", lengthInSeconds: 120),
            makeSong(title: "Three", lengthInSeconds: 180),
            makeSong(title: "Four", lengthInSeconds: 240),
        ]
        return PlaylistViewModel(songs: someSongs)
    }

    @Test("Removes one song from the end when that is enough")
    func removesOne() {
        let viewModel: PlaylistViewModel = makeNineMinutePlaylist()
        let songsRemoved: Int = viewModel.trimToFit(minutes: 8)
        #expect(songsRemoved == 1)
        #expect(titles(of: viewModel.songs) == ["Two", "Three"])
    }

    @Test("Keeps removing from the end until the playlist fits")
    func removesTwo() {
        let viewModel: PlaylistViewModel = makeNineMinutePlaylist()
        let songsRemoved: Int = viewModel.trimToFit(minutes: 4)
        #expect(songsRemoved == 2)
        #expect(titles(of: viewModel.songs) == ["Two"])
    }

    @Test("Requirement: a playlist exactly as long as the drive already fits")
    func exactFit() {
        let viewModel: PlaylistViewModel = makeNineMinutePlaylist()
        let songsRemoved: Int = viewModel.trimToFit(minutes: 9)
        #expect(songsRemoved == 0)
        #expect(viewModel.songs.count == 3)
    }

    @Test("A drive of 0 minutes removes every song, and stops when the playlist is empty")
    func zeroMinutes() {
        let viewModel: PlaylistViewModel = makeNineMinutePlaylist()
        let songsRemoved: Int = viewModel.trimToFit(minutes: 0)
        #expect(songsRemoved == 3)
        #expect(viewModel.songs.count == 0)
    }

    @Test("A long drive removes nothing")
    func longDrive() {
        let viewModel: PlaylistViewModel = makeNineMinutePlaylist()
        let songsRemoved: Int = viewModel.trimToFit(minutes: 120)
        #expect(songsRemoved == 0)
        #expect(viewModel.songs.count == 3)
    }

    @Test("An empty playlist: nothing to remove")
    func emptyPlaylist() {
        let viewModel: PlaylistViewModel = PlaylistViewModel(songs: [])
        #expect(viewModel.trimToFit(minutes: 0) == 0)
    }

}

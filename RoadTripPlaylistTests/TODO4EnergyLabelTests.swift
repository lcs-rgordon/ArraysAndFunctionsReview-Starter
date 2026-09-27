//
//  TODO4EnergyLabelTests.swift
//  RoadTripPlaylistTests
//

import Testing
@testable import RoadTripPlaylist

@MainActor
@Suite("TODO 4: energyLabel(for:)")
struct TODO4EnergyLabelTests {

    // MARK: - Stored properties

    let viewModel: PlaylistViewModel = PlaylistViewModel(songs: [])

    // MARK: - Functions

    @Test("A fast, short song is \"Sprint\"")
    func fastAndShort() {
        #expect(viewModel.energyLabel(for: makeSong(lengthInSeconds: 150, beatsPerMinute: 140)) == "Sprint")
    }

    @Test("A fast, long song is \"Dance\"")
    func fastAndLong() {
        #expect(viewModel.energyLabel(for: makeSong(lengthInSeconds: 240, beatsPerMinute: 140)) == "Dance")
    }

    @Test("A medium-speed song is \"Cruise\"")
    func mediumSpeed() {
        #expect(viewModel.energyLabel(for: makeSong(lengthInSeconds: 200, beatsPerMinute: 100)) == "Cruise")
    }

    @Test("A slow song is \"Chill\"")
    func slow() {
        #expect(viewModel.energyLabel(for: makeSong(lengthInSeconds: 200, beatsPerMinute: 70)) == "Chill")
    }

    @Test("Requirement: exactly 120 beats per minute counts as fast")
    func exactly120() {
        #expect(viewModel.energyLabel(for: makeSong(lengthInSeconds: 150, beatsPerMinute: 120)) == "Sprint")
    }

    @Test("Requirement: exactly 180 seconds is not shorter than 180, so a fast song that long is \"Dance\"")
    func exactly180Seconds() {
        #expect(viewModel.energyLabel(for: makeSong(lengthInSeconds: 180, beatsPerMinute: 130)) == "Dance")
    }

    @Test("Just under the fast boundary: 119 beats per minute is \"Cruise\"")
    func just119() {
        #expect(viewModel.energyLabel(for: makeSong(lengthInSeconds: 150, beatsPerMinute: 119)) == "Cruise")
    }

    @Test("Requirement: exactly 90 beats per minute is \"Cruise\", and 89 is \"Chill\"")
    func around90() {
        #expect(viewModel.energyLabel(for: makeSong(beatsPerMinute: 90)) == "Cruise")
        #expect(viewModel.energyLabel(for: makeSong(beatsPerMinute: 89)) == "Chill")
    }

    @Test("A slow song is \"Chill\" however short it is (length only matters for fast songs)")
    func slowAndShort() {
        #expect(viewModel.energyLabel(for: makeSong(lengthInSeconds: 60, beatsPerMinute: 60)) == "Chill")
    }

}

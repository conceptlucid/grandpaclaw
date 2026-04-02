// MARK: - ElevenLabsKit Stub for Swift 5.9 compatibility
// The actual ElevenLabsKit requires Swift 6.2, so we stub it out for now

import Foundation

public enum ElevenLabsKit {
    public struct ElevenLabsVoice: Codable, Sendable {
        public let id: String
        public let name: String
        public init(id: String, name: String) { self.id = id; self.name = name }
    }

    public struct ElevenLabsTTSRequest: Sendable {
        public let voiceId: String
        public let text: String
        public init(voiceId: String, text: String) { self.voiceId = voiceId; self.text = text }
    }

    public class ElevenLabsTTSClient: @unchecked Sendable {
        public init() {}
        public func synthesize(_ request: ElevenLabsTTSRequest) async throws -> Data { Data() }
    }

    public struct TalkTTSValidation: Sendable {
        public init(voiceId: String) {}
    }

    public class StreamingAudioPlayer: @unchecked Sendable {
        public init() {}
        public func play(_ data: Data) async throws {}
        public func stop() {}
    }

    public class PCMStreamingAudioPlayer: @unchecked Sendable {
        public init() {}
        public func play(_ data: Data) async throws {}
        public func stop() {}
    }

    public struct StreamingPlaybackResult: Sendable {
        public init() {}
    }
}

public typealias ElevenLabsVoice = ElevenLabsKit.ElevenLabsVoice
public typealias ElevenLabsTTSRequest = ElevenLabsKit.ElevenLabsTTSRequest
public typealias ElevenLabsTTSClient = ElevenLabsKit.ElevenLabsTTSClient
public typealias TalkTTSValidation = ElevenLabsKit.TalkTTSValidation
public typealias StreamingAudioPlayer = ElevenLabsKit.StreamingAudioPlayer
public typealias PCMStreamingAudioPlayer = ElevenLabsKit.PCMStreamingAudioPlayer
public typealias StreamingPlaybackResult = ElevenLabsKit.StreamingPlaybackResult

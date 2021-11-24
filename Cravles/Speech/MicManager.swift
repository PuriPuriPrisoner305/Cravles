//
//  MicManager.swift
//  Cravles
//
//  Created by Indah Nurindo on 24/11/2564 BE.
//

import Foundation
import AVFoundation

class MicMonitor: ObservableObject {
    private var audioRecorder: AVAudioRecorder
    private var timer: Timer?
    private var currentSample: Int
    private let numberOfSamples: Int
    
    @Published public var soundSamples: [Float]
    
    init(numberOfSamples: Int ) {
        self.numberOfSamples = numberOfSamples > 0 ? numberOfSamples : 10
        self.soundSamples = [Float](repeating: .zero, count: numberOfSamples)
        self.currentSample = 0
        
        let audiosession = AVAudioSession.sharedInstance()
           if audiosession.recordPermission != .granted {
               audiosession.requestRecordPermission{ (success) in
                   if !success {
                   fatalError("We need audio recording for visualization")
               }
               }
        }
        let url = URL(fileURLWithPath: "/dev/null", isDirectory: true)
        let recordersSettings: [String: Any] = [
            AVFormatIDKey: NSNumber(value: kAudioFormatAppleLossless),
            AVSampleRateKey: 44100.0,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue ]
        do {
            audioRecorder = try AVAudioRecorder(url: url, settings: recordersSettings)
            try audiosession.setCategory(.playAndRecord, mode: .default, options: [])
        } catch {
            fatalError(error.localizedDescription)
        }
        
    }
    public func startMornitoring() {
        audioRecorder.isMeteringEnabled = true
        audioRecorder.record()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (timer) in
            self.audioRecorder.updateMeters()
            self.soundSamples[self.currentSample] = self.audioRecorder.averagePower(forChannel: 0)
            self.currentSample = (self.currentSample + 1) % self.numberOfSamples
        })
    }
    public func stopMonitoring() {
        audioRecorder.stop()
    }
    deinit {
        timer?.invalidate()
        audioRecorder.stop()
    }
}

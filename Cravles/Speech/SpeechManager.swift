//
//  SpeechManager.swift
//  Cravles
//
//  Created by Indah Nurindo on 24/11/2564 BE.
//Reflection

import Foundation
import Speech

class SpeechManager {
    public var isRecording = false
    
    private var audioEngine: AVAudioEngine!
    private var inputNote: AVAudioInputNode!
    private var audiosession: AVAudioSession!
    
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    
    func chechkPermissions() {
        SFSpeechRecognizer.requestAuthorization{ (authStatus) in
            DispatchQueue.main.async {
                switch authStatus {
                case .authorized: break
                default:
                    print("Speech recognition is not available")
                }
            }
        }
    }
    func start(completion: @escaping (String?) -> Void) {
        if isRecording {
            stopRecording()
        } else {
            startRecording(completion: completion)
        }
    }
    func startRecording(completion: @escaping (String?) -> Void) {
        guard let recognizer = SFSpeechRecognizer(), recognizer.isAvailable else {
            print("Speech recognition is not available")
            return
        }
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        recognitionRequest!.shouldReportPartialResults = true
        
        recognizer.recognitionTask(with: recognitionRequest!) { (result, error) in guard error == nil else{
            print("got error \(error!.localizedDescription)")
            return
        }
            guard let result = result else {
                return
            }
            if result.isFinal {
                completion(result.bestTranscription.formattedString)
            }

        }
        audioEngine  = AVAudioEngine()
        inputNote = audioEngine.inputNode
        let recordingFormat = inputNote.outputFormat(forBus: 0)
        inputNote.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, _) in
            self.recognitionRequest?.append(buffer)
        }
        audioEngine.prepare()
        do {
            audiosession = AVAudioSession.sharedInstance()
            try audiosession.setCategory(.record, mode: .spokenAudio, options: .duckOthers)
            try audiosession.setActive(true, options: .notifyOthersOnDeactivation)
            try audioEngine.start()
        } catch {
            print(error)
        }
    }
    func stopRecording() {
        recognitionRequest?.endAudio()
        recognitionRequest = nil
        audioEngine.stop()
        inputNote.removeTap(onBus: 0)
        
        try? audiosession.setActive(false)
        audiosession = nil
    
    }
}

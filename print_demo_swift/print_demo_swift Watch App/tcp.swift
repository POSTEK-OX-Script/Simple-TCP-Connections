//import Foundation
//import Darwin
//
//public class TCPClient {
//
//    private var inputStream: InputStream!
//    private var outputStream: OutputStream!
//    private var buffer = [UInt8](repeating: 0, count: 4096)
//
//    public init(address: String, port: UInt32) {
//        var readStream:  Unmanaged<CFReadStream>?
//        var writeStream: Unmanaged<CFWriteStream>?
//
//        CFStreamCreatePairWithSocketToHost(nil, address as CFString, port, &readStream, &writeStream)
//
//        inputStream = readStream!.takeRetainedValue()
//        outputStream = writeStream!.takeRetainedValue()
//
//        inputStream.schedule(in: .current, forMode: .common)
//        outputStream.schedule(in: .current, forMode: .common)
//
//        inputStream.open()
//        outputStream.open()
//    }
//
//    deinit {
//        inputStream.close()
//        outputStream.close()
//    }
//
//    public func send(data: Data) -> Bool {
//        let bytesWritten = outputStream.write([UInt8](data), maxLength: data.count)
//        return bytesWritten > 0
//    }
//
//    public func send(string: String) -> Bool {
//        if let data = string.data(using: .utf8) {
//            return send(data: data)
//        }
//        return false
//    }
//
//    public func receive() -> String? {
//        var receivedString: String?
//
//        let bytesRead = inputStream.read(&buffer, maxLength: buffer.count)
//        if bytesRead > 0 {
//            receivedString = String(bytes: buffer, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines)
//        }
//
//        return receivedString
//    }
//
//    public func close() {
//        inputStream.close()
//        outputStream.close()
//    }
//}

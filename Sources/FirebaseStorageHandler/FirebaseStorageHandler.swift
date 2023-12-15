import Firebase
import FirebaseStorage

public final class FirebaseStorageHandler {
    private let storage = Storage.storage()
    
    public init() {}
    
    public func configure() {
        FirebaseApp.configure()
    }
    
    public func uploadImageData(
        _ data: Data,
        collectionName: String,
        imageName: String
    ) async throws {
        let imageRef = storage.reference().child("\(collectionName)/\(imageName)")
        _ = try await imageRef.putDataAsync(data)
    }
    
    public func uploadImageFile(
        _ file: URL,
        collectionName: String,
        imageName: String
    ) async throws {
        let imageRef = storage.reference().child("\(collectionName)/\(imageName)")
        _ = try await imageRef.putFileAsync(from: file)
    }
    
    public func downloadImage(
        collectionName: String,
        imageName: String
    ) async throws -> Data {
        let imageRef = storage.reference().child("\(collectionName)/\(imageName)")
        return try await imageRef.data(maxSize: 1 * 1024 * 1024)
    }
    
    public func deleteImage(
        collectionName: String,
        imageName: String
    ) async throws {
        let imageRef = storage.reference().child("\(collectionName)/\(imageName)")
        try await imageRef.delete()
    }
}

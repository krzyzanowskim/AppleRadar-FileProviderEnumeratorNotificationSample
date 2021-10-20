//
//  Document.swift
//  FileProviderEnumeratorNotificationSample
//
//  Created by Marcin Krzyzanowski on 20/10/2021.
//

import UIKit

class Document: UIDocument {
    
    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        return Data()
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
    }
}


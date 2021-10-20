//
//  FileProviderItem.swift
//  SampleFileProvider
//
//  Created by Marcin Krzyzanowski on 20/10/2021.
//

import FileProvider
import UniformTypeIdentifiers

class FileProviderItem: NSObject, NSFileProviderItem {

    // TODO: implement an initializer to create an item from your extension's backing model
    // TODO: implement the accessors to return the values from your extension's backing model
    
    var itemIdentifier: NSFileProviderItemIdentifier {
        return NSFileProviderItemIdentifier("")
    }
    
    var parentItemIdentifier: NSFileProviderItemIdentifier {
        return NSFileProviderItemIdentifier("")
    }
    
    var capabilities: NSFileProviderItemCapabilities {
        return [.allowsReading, .allowsWriting, .allowsRenaming, .allowsReparenting, .allowsTrashing, .allowsDeleting]
    }
    
    var filename: String {
        return ""
    }
    
    var contentType: UTType {
        return itemIdentifier == NSFileProviderItemIdentifier.rootContainer ? .folder : .plainText
    }
    
}

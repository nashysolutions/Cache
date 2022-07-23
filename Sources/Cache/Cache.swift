import Foundation

public struct Cache<Item> {
    
    private let database: Database<Item>
    
    public init() {
        database = Database<Item>()
    }

    public func stash(_ item: Item, with identifier: UUID, duration: Expiry) {
        let resource = Resource<Item>(item: item, identifier: identifier, expiry: duration.date)
        database.stash(resource)
    }
    
    public func resource(for identifier: UUID) -> Item? {
        database.resource(for: identifier)?.item
    }
}

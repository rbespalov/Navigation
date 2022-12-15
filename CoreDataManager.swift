
import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    init() {
        reloadPosts()
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "post")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    var posts: [FavoritePost] = []
    
    func reloadPosts() {
        let request = FavoritePost.fetchRequest()
        let posts = (try? persistentContainer.viewContext.fetch(request)) ?? []
        self.posts = posts
    }
    
    func addPost(author: String, description: String, image: String, likes: Int, views: Int) {
        let post = FavoritePost(context: persistentContainer.viewContext)
        post.author = author
        post.descript = description
        post.image = image
        post.likes = Int16(likes)
        post.views = Int16(views)
        saveContext()
        reloadPosts()
    }
}

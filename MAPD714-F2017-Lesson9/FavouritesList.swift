
import Foundation
import UIKit

class  FavouritesList{
    
    //private instance members/variables
    static let sharedFavouritesList = FavouritesList()
    
    private(set) var favourites:[String]
    
    //constructor
    init() {
        let defaults = UserDefaults.standard
        let storedFavourites = defaults.object(forKey: "favourites") as? [String]
        favourites = storedFavourites != nil ? storedFavourites! : []
    }
    
    //this method adds a font to the user preference file
    func addFavourite(fontName: String)
    {
        if !favourites.contains(fontName)
        {
            favourites.append(fontName)
            saveFavourites()
        }
    }
    
    //this method saves font favourites to the user preference file
    private func saveFavourites()
    {
        let defaults = UserDefaults.standard
        defaults.set(favourites, forKey: "favourites")
        defaults.synchronize()
        
    }
    
    //this method removes font favourites to the user preference file
    func removeFavourites (fontName: String){
        if let index = favourites.index(of: fontName){
            favourites.remove(at: index)
            saveFavourites()
        }
        
    }
    func moveItem(fromIndex from: Int , toIndex to: Int){
        let item = favourites[from]
        favourites.remove(at: from)
        favourites.insert(item, at: to)
        saveFavourites()
    }
    
}



import UIKit


class FontInfoViewController: UIViewController {

    var font: UIFont!
    var favourite:Bool = false
    
    @IBOutlet weak var fontSampleLabel: UILabel!
    
    @IBOutlet weak var favouriteSwitch: UISwitch!
    @IBOutlet weak var fontSizeLabel: UILabel!
    //@IBOutlet weak var favouriteSwitch: UISwitch!
    @IBOutlet weak var fontSizeSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       fontSampleLabel.font = font
        fontSampleLabel.text = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz 0123456789"
        fontSizeSlider.value = Float(font.pointSize)
        fontSizeLabel.text = "\(Int(font.pointSize))"
        favouriteSwitch.isOn = favourite
    }
    
    @IBAction func slideFontSize(_ sender: UISlider) {
        let newSize = round(sender.value)
        fontSampleLabel.font = font.withSize(CGFloat(newSize))
        fontSizeLabel.text = "\(Int(newSize))"
        
    }
    
    @IBAction func toggleFavourite(_ sender: UISwitch) {
    
    
   
        let favouritesList = FavouritesList.sharedFavouritesList
        if sender.isOn {
            favouritesList.addFavourite(fontName: font.fontName)
            
        }else{
            favouritesList.removeFavourites(fontName: font.fontName)
        }
    }
    
}

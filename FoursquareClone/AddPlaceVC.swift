//
//  AddPlaceVC.swift
//  FoursquareClone
//
//  Created by Vedat Dokuzkardeş on 23.11.2023.
//

import UIKit

class AddPlaceVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var placeNameTxt: UITextField!
    @IBOutlet weak var placeTypeTxt: UITextField!
    @IBOutlet weak var placeAtmosphereTxt: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageView.addGestureRecognizer(gestureRecognizer)

        
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        if placeNameTxt.text != "" && placeTypeTxt.text != "" && placeAtmosphereTxt.text != "" {
            if let chosenImage = imageView.image {
                let placemodel = PlaceModel.sharedInstance
                placemodel.placeName = placeNameTxt.text!
                placemodel.placeType = placeTypeTxt.text!
                placemodel.placeAtmosphere = placeAtmosphereTxt.text!
                placemodel.placeImage = chosenImage
                
            }
            
            performSegue(withIdentifier: "toMapVC", sender: nil)
            
        }else{
            let alert = UIAlertController(title: "Error", message: "Place Name/Type/Atmosphere??", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    @objc func chooseImage(){
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    

}

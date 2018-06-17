//
//  ImagesViewController.swift
//  LearnToWeek7
//
//  Created by Alex Turnbull on 16/06/2018.
//  Copyright © 2018 Alex Turnbull. All rights reserved.
//

import UIKit

class ImagesViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Taking Photos"
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func takePhotoTapped(_ sender: Any) {
        let src = UIImagePickerControllerSourceType.photoLibrary
        guard UIImagePickerController.isSourceTypeAvailable(src)
            else {return}
        let picker = UIImagePickerController()
        // picker.sourceType = src
        picker.sourceType = .photoLibrary
        picker.delegate = self
        self.present(picker, animated: true)
    }
    
    @IBAction func saveImageTapped(_ sender: Any) {
        saveImage(imageName: "test.png")
    }
    
    func saveImage(imageName : String) {
        let fileManager = FileManager.default;
        
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        
        // fix this
        let imageToSave = image.image!
        let data = UIImagePNGRepresentation(imageToSave)
        
        fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)
        
        // create the alert
        let alert = UIAlertController(title: "Info", message: "Photo Saved", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        image.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismiss(animated:true) {
            // do something with the chosen item here
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

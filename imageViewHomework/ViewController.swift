//
//  ViewController.swift
//  imageViewHomework
//
//  Created by Zedd on 2017. 1. 18..
//  Copyright © 2017년 최송이. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    let imagePicker = UIImagePickerController()

    
    var picker: UIImagePickerController?=UIImagePickerController()
    
    @IBOutlet weak var imgaePickerView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        let alert = UIAlertController()
        alert.message = "사진을 가져올 소스를 선택해주세요"
        alert.title = "사진소스선택"
        
        let cameraAction = UIAlertAction(title: "카메라", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openCamera()
            
        }
        let gallaryAction = UIAlertAction(title: "사진앨범", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            self.openGallary()
        }

        
        picker?.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
       

        self.present(alert, animated: false, completion: nil)
        
      
    
    }
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera))
        {
            picker!.sourceType = UIImagePickerControllerSourceType.camera
            self .present(picker!, animated: true, completion: nil)
            picker?.allowsEditing = true
        }
        else
        {
            openGallary()
        }
    }
    
    func openGallary()
    {

        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(imagePicker, animated: false, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            imgaePickerView.contentMode = .scaleAspectFit
            imgaePickerView.image = image
            
        }
        dismiss(animated: true, completion: nil)
        
        let success = UIAlertController(title: "", message : "이미지를 성공적으로 가져왔어요", preferredStyle :.alert)
        success.addAction(UIAlertAction(title:"확인",style :.cancel))
        self.present(success , animated: true)

        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
    
    
    

}



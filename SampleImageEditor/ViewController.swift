//
//  ViewController.swift
//  SampleImageEditor
//
//  Created by ycsong on 2021/11/09.
//

import UIKit

class ViewController: UIViewController {
    
    private let picker = UIImagePickerController()
    @IBOutlet weak var imageView: UIImageView!
    
    private func initPicker() {
        self.picker.delegate = self
        self.picker.sourceType = .photoLibrary
        self.picker.modalPresentationStyle = .fullScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initPicker()
    }
    
    @IBAction func openLibrary(_ sender: Any) {
        self.present(picker, animated: true, completion: nil)
    }
}

//MARK: - UIImagePickerController Delegate
extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.dismiss(animated: false, completion: {
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            })
        }
    }
}

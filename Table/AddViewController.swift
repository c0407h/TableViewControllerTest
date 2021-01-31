//
//  AddViewController.swift
//  Table
//
//  Created by 이충현 on 2021/01/31.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 
    
    let MAX_ARRAY_NUM = 3
    let PICEKR_VIEW_COLUMN = 1
    var imageArray = [UIImage?]()
    let PICKER_VIEW_HEIGHT:CGFloat = 40
    var imageFileName = ["cart.png", "clock.png", "pencil.png"]
    var fileName = ""
    
    @IBOutlet var tfAddItem: UITextField!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var pickerImage: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image!)
        }
        imageView.image = imageArray[0]
        fileName = imageFileName[0]
        
    }
    
    //Add View와 + 버튼을 활용하여 새목록을 추가하는 기능
    @IBAction func btnAddItem(_ sender: UIButton) {
    //새목록 추가하기
        //items에 텍스트 필드의 텍스트 값을 추가
        items.append(tfAddItem.text!)
        //itemsImageFile에는 무조건 clock.png 파일을 추가
        //itemsImageFile.append("clock.png")
        
        itemsImageFile.append(fileName)
        
        //텍스트 필드의 내용을 지움
        tfAddItem.text = ""
        //루트 뷰 컨트롤러, 즉 테이블뷰로 돌아간다.
        _ = navigationController?.popViewController(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICEKR_VIEW_COLUMN
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imageView.image = imageArray[row]
        fileName = imageFileName[row]
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 40 , height: 40)
        
        return imageView
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

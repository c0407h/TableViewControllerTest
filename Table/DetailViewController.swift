//
//  DetailViewController.swift
//  Table
//
//  Created by 이충현 on 2021/01/31.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var lblItem: UILabel!
    
    //Main View에서 받을 텍스트를 위해 변수 receiveItem 선언
    var receiveItems = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //뷰가 노출될 때마다 이 내용을 레이블의 텍스트로 표시
        lblItem.text = receiveItems
    }
    
    //Main View에서 변수를 받기 위한 함수 추가
    func receiveItem(_ item: String)
    {
        receiveItems = item
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

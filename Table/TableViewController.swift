//
//  TableViewController.swift
//  Table
//
//  Created by 이충현 on 2021/01/31.
//

import UIKit


//외부 변수인 items 지정
var items = ["책 구매", "철수와 약속", "스터디 준비하기"]
//외부 변수인 ㅇ미ㅣ지 파일 설정
var itemsImageFile = ["cart.png", "clock.png", "pencil.png"]

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        //화면상 오른쪽상단에 Add 버튼이 있기때문에 Edit 버튼은 왼쪽상단에 만들어주기 위해 left로 만들어줌
        // Edit 버튼을 누르면 왼쪽에 붉은 원이 나오는데 붉은 원을 클릭하면 오른쪽에 삭제버튼이 나옴
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        // 보통은 테이블 안에 섹션이 한개이므로 numberOfSections의 리턴 값을 1로 한다
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        //섹션당 열의 개수는 Items의 개수이므로 리턴 값을 items.count로 한다.
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        //셀의 텍스트 레이블에 앞에서 선언한 items(책구매, 철수와 약속, 스터디 준비하기)를 대입한다
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        //셀의 이미지 뷰에 앞에서 선언한 itemsImageFile을 대입
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row])

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

 
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            //셀삭제
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    //영어로 되어있는 삭제 버튼 한글로 변경
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    

    
    // Override to support rearranging the table view.
    // 목록 순서 바꾸기
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        //이동할 아이템의 위치를 itemToMove에 저장
        let itemToMove = items[(fromIndexPath as NSIndexPath).row]
        //이동할 아이템의 이미지를 itemImageToMove에 저장
        let itemImageToMove = itemsImageFile[(fromIndexPath as NSIndexPath).row]
        //이동할 아이템을 삭제, 이때 삭제한 아이템 뒤의 아이템들의 인덱스가 재정렬됨
        items.remove(at: (fromIndexPath as NSIndexPath).row)
        //이동할 아이템의 이미지를 삭제, 이때 삭제한 아이템 이미지 뒤의 아이템 이미지들의 인덱스가 재정렬됨
        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row)
        //삭제된 아이템을 이동할 위치로 삽입, 삽입한 아이템 뒤의 아이템들의 인덱스가 재정렬됨
        items.insert(itemToMove, at:(to as NSIndexPath).row)
        //삭제된 아이템의 이미지를 이동할 위치로 삽입, 삽입한 아이템 이미지 뒤의 아이템이미지들의 인덱스가 재정렬됨
        itemsImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row)
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            
            let indexPath = self.tvListView.indexPath(for: cell)
            
            let detailView = segue.destination as! DetailViewController
            
            detailView.receiveItem(items[(indexPath! as NSIndexPath).row])
        }
    }
    
    
     //viewWillAppear는 뷰가 전환될때 휴출되는 함수로 리스트가 추가되어 Main View로 돌아올 때 호출되며 추가된 내용을 리스트에 보여준다
    override func viewWillAppear(_ animated: Bool) {
        // 테이블뷰를 다시 불러온다. (reload)
        tvListView.reloadData()
    }

}

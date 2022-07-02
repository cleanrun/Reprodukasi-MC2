//
//  MaterialsVC.swift
//  Reprodukasi
//
//  Created by cleanmac-ada on 22/06/22.
//

import UIKit

class MaterialsVC: UIViewController, UINavigationBarDelegate {
    
    
    @IBOutlet weak var materiTableView: UITableView!
   

    var data : Root = Root(section: [])

    
    init() {
        super.init(nibName: "MaterialsVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
                
        //navigationController?.navigationBar.delegate = self
        navigationController?.navigationItem.title = "Coba"
        navigationController?.navigationBar.prefersLargeTitles = true
      
        setupTable()
        addData()
    }
    
    
    func setupTable(){
        let nib = UINib(nibName: "MaterialListCell", bundle: nil)
        
//        materiTableView.register(UINib(nibName: "section1", bundle: nil), forCellReuseIdentifier: "section1")
        materiTableView.register(nib, forCellReuseIdentifier: "custom1")
        materiTableView.delegate = self
        materiTableView.dataSource = self
        
        materiTableView.layer.cornerRadius = 10
        
    }
    
    func addData(){
        data = MaterialData.shared.fetchData()
        materiTableView.reloadData()
    }
            

}

extension MaterialsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.section.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        data2 = data.section[section].materials
        return data.section[section].materials.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = materiTableView.dequeueReusableCell(withIdentifier: "custom1") as! MaterialListCell

        cell.materialModel = data.section[indexPath.section].materials[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))

            let label = UILabel()
            label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
            label.text = data.section[section].title
            label.textColor = .black
            label.font = .systemFont(ofSize: 16, weight: .semibold)

            headerView.addSubview(label)

            return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
    }
    


}



    

    
   


//extension MaterialsVC: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return materiTableView.frame.height / 8
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        materiTableView.deselectRow(at: indexPath, animated: true)
//    }
//}

 


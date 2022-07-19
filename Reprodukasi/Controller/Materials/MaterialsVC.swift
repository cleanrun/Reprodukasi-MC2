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
      
        setupTable()
        addData()
    }
    
    
    func setupTable(){
        
        title = "Materi"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let nib = UINib(nibName: "MaterialListCell", bundle: nil)
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
            label.font = .systemFont(ofSize: 20, weight: .semibold)

            headerView.addSubview(label)

            return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 35
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        let button = ContentVC(nibName: "ContentVC", bundle: nil)
        if indexPath == [0,0] {
            button.objects = ["siapa-yang-masih-merokok-di-sini-1","siapa-yang-masih-merokok-di-sini-2","siapa-yang-masih-merokok-di-sini-3","siapa-yang-masih-merokok-di-sini-4","siapa-yang-masih-merokok-di-sini-5","siapa-yang-masih-merokok-di-sini-6"]
        }
        else if indexPath == [0,1] {
            button.objects = ["olahraga-intensitas-tinggi-tidak-baik-1","olahraga-intensitas-tinggi-tidak-baik-2","olahraga-intensitas-tinggi-tidak-baik-3","olahraga-intensitas-tinggi-tidak-baik-4","olahraga-intensitas-tinggi-tidak-baik-5","olahraga-intensitas-tinggi-tidak-baik-6"]
        }
        
    
        else if indexPath == [1,0] {
            button.objects = ["sabun-kewanitaan-menyebabkan-iritasi-1","sabun-kewanitaan-menyebabkan-iritasi-2","sabun-kewanitaan-menyebabkan-iritasi-3","sabun-kewanitaan-menyebabkan-iritasi-4","sabun-kewanitaan-menyebabkan-iritasi-5","sabun-kewanitaan-menyebabkan-iritasi-6"]
        }
        
        else if indexPath == [2,0] {
            button.objects = ["masa-tidak-suka-ikan-1", "masa-tidak-suka-ikan-2",
                              "masa-tidak-suka-ikan-3", "masa-tidak-suka-ikan-4",
                              "masa-tidak-suka-ikan-5" ,"masa-tidak-suka-ikan-6"]

        }
        
        else if indexPath == [2,1] {
            button.objects = ["pose-bridge-untuk-kesehatan-reproduksi-1","pose-bridge-untuk-kesehatan-reproduksi-2","pose-bridge-untuk-kesehatan-reproduksi-3","pose-bridge-untuk-kesehatan-reproduksi-4","pose-bridge-untuk-kesehatan-reproduksi-5","pose-bridge-untuk-kesehatan-reproduksi-6"]
        }
        
        
        button.modalPresentationStyle = .overCurrentContext
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            if topController is MainTabBarVC {
                topController.present(button, animated: true)
            }

            // topController should now be your topmost view controller
        }
        
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

 


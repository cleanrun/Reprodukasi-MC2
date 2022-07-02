//
//  ContentVC.swift
//  Reprodukasi
//
//  Created by Muhammad Rifan Setiawan on 01/07/22.
//

import UIKit


class ContentVC: UIViewController ,UICollectionViewDelegate, UICollectionViewDataSource {
    let objects = ["masa-tidak-suka-ikan-1", "masa-tidak-suka-ikan-2", "masa-tidak-suka-ikan-3", "masa-tidak-suka-ikan-4", "masa-tidak-suka-ikan-5"
    ,"masa-tidak-suka-ikan-1"]

    @IBOutlet var myPageControl: UIPageControl!
    
    @IBOutlet var collectionView: UICollectionView!
    var currentCellIndex = 0
    let cellIdentifier = "cellIdentifier"
    var timer:Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName:"ContentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
       //or if you use class:
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        //let myPageControl = CHIPageControlJaloro(frame: CGRect(x: 0, y:0, width: 100, height: 20))
        //myPageControl.transform = CGAffineTransform(scaleX: 5, y: 1);
        
        //timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
        myPageControl.numberOfPages = self.objects.count
        myPageControl.currentPage = 0
        //collectionView!.pagingEnabled = true
        // Do any additional setup after loading the view.
    }
    
    @objc func slideToNext()
    {
        if currentCellIndex < objects.count - 1
        {
            currentCellIndex = currentCellIndex + 1
        }
        else {
            currentCellIndex = 0
        }
        
        myPageControl.currentPage = currentCellIndex
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
        
    }
    
    //let objects = ["Cat", "Dog", "Fish"]

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return self.objects.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ContentCollectionViewCell

          //in this example I added a label named "title" into the MyCollectionCell class
          //cell.title.text = self.objects[indexPath.item]
          cell.myImage.image = UIImage(named: objects[indexPath.row])

          return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width
                      , height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        myPageControl.currentPage = indexPath.row
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



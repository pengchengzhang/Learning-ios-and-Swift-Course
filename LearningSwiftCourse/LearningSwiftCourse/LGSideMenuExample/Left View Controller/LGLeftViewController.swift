//
//  LeftViewController.swift
//  LGSideMenuControllerDemo
//

class LGLeftViewController: UITableViewController {
    
    private let titlesArray = ["Open Right View",
                               "",
                               "Change Root VC",
                               "",
                               "Profile",
                               "News",
                               "Articles",
                               "Video",
                               "Music",      
                               "Dismiss",
        
        
    ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.contentInset = UIEdgeInsets(top: 44.0, left: 0.0, bottom: 44.0, right: 0.0)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }

    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .fade
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LGLeftViewCell

        cell.titleLabel.text = titlesArray[indexPath.row]
        cell.separatorView.isHidden = (indexPath.row <= 3 || indexPath.row == self.titlesArray.count-1)
        cell.isUserInteractionEnabled = (indexPath.row != 1 && indexPath.row != 3)

        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (indexPath.row == 1 || indexPath.row == 3) ? 22.0 : 44.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainViewController = sideMenuController!
        
        if indexPath.row == 0 {
            if mainViewController.isLeftViewAlwaysVisibleForCurrentOrientation {
                mainViewController.showRightView(animated: true, completionHandler: nil)
            }
            else {
                mainViewController.hideLeftView(animated: true, completionHandler: {
                    mainViewController.showRightView(animated: true, completionHandler: nil)
                })
            }
        }
        else if indexPath.row == 2 {
            let navigationController = mainViewController.rootViewController as! LGNavigationController
            let viewController = self.storyboard!.instantiateViewController(withIdentifier: "LGViewController")
            
            navigationController.setViewControllers([viewController], animated: false)

            // Rarely you can get some visual bugs when you change view hierarchy and toggle side views in the same iteration
            // You can use delay to avoid this and probably other unexpected visual bugs
            mainViewController.hideLeftView(animated: true, delay: 0.0, completionHandler: nil)
        }
        else if indexPath.row == 9 {
        //Mark: - Dismiss controller
            dismiss(animated: true) { 
                print("view controller dismissed, now going to home page")
            }
        }
        else {
            let viewController = UIViewController()
            viewController.view.backgroundColor = .white
            viewController.title = "Test \(titlesArray[indexPath.row])"

            let navigationController = mainViewController.rootViewController as! LGNavigationController
            navigationController.pushViewController(viewController, animated: true)
            
            mainViewController.hideLeftView(animated: true, completionHandler: nil)
        }
    }
    
}

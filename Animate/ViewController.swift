//
//  ViewController.swift
//  Animate
//
//  Created by Ahmed Khedr on 9/21/17.
//  Copyright © 2017 Ahmed Khedr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var syncButton: UIBarButtonItem!
    @IBOutlet weak var updateButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var updateLabel: UILabel!
    var syncLabel: UILabel!
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeSearchController()
        
        // y and width for both labels
        let y = navigationController!.navigationBar.frame.height + UIApplication.shared.statusBarFrame.height + 8
        let width = view.bounds.width * 0.4
        
        // iPhone8+ example
        // - 8 + 165.6 (0.4 of total) + 82.8 (0.2 of total) = 452.8
        let syncX = -8 + (width * 1.5)
        
        syncLabel = UILabel(frame: CGRect(x: syncX, y: y, width: width, height: 0))
        view.addSubview(syncLabel)
        syncLabel.backgroundColor = UIColor.red
        syncLabel.textColor = UIColor.white
        syncLabel.text = "Sync Label Sync Label Sync Label Sync Label Sync"
        syncLabel.numberOfLines = 0
        syncLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        syncLabel.sizeToFit()
        
        let updateX = view.bounds.minX + 8
        updateLabel = UILabel(frame: CGRect(x: updateX, y: y, width: width, height: 0))
        view.addSubview(updateLabel)
        updateLabel.backgroundColor = UIColor.red
        updateLabel.textColor = UIColor.white
        updateLabel.text = "Update Label Update Label Update Label Update Label Update Label "
        updateLabel.numberOfLines = 0
        updateLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        updateLabel.sizeToFit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Remove labels from the view initially
        updateLabel.center.y -= view.bounds.height
        syncLabel.center.y -= view.bounds.height
    }
    
    @IBAction func updateAction(_ sender: UIBarButtonItem) {
        // Put back to its original position
        UIView.animate(withDuration: 0.5) {
            self.updateLabel.center.y += self.view.bounds.height
        }
        
        // Make disappear
        UIView.animate(withDuration: 0.5,
                       delay: 2,
                       options: .curveLinear,
                       animations: {
                        self.updateLabel.center.y -= self.view.bounds.height
                        
        },
                       completion: nil)
    }
    
    @IBAction func syncAction(_ sender: UIBarButtonItem) {
        
        // Adjust origin x according to syncLabel width defined by word wrapping and length of text
        if syncLabel.frame.origin.x - view.bounds.width + syncLabel.bounds.width != -8 {
            syncLabel.frame.origin.x = view.bounds.width - syncLabel.bounds.width - 8
        }
        
        UIView.animate(withDuration: 0.5) {
            self.syncLabel.center.y += self.view.bounds.height
        }
        
        UIView.animate(withDuration: 0.5,
                       delay: 2,
                       options: .curveLinear,
                       animations: {
                        self.syncLabel.center.y -= self.view.bounds.height
                        
        },
                       completion: nil)
    }
    
    // MARK:- UISearchController
    
    func initializeSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        tableView.tableHeaderView = searchController.searchBar
        
        let all = NSLocalizedString("All", comment: "")
        let favorites = NSLocalizedString("Favorites", comment: "")
        searchController.searchBar.scopeButtonTitles = [all, favorites]
        
        let searchPublications = NSLocalizedString("Search", comment: "")
        searchController.searchBar.placeholder = searchPublications
        
        // Set the delegates
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        
        // Presentation
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = true
        
        searchController.searchBar.sizeToFit()
        searchController.loadViewIfNeeded()
    }
}

extension ViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    // MARK: - Search results updating
    
    func updateSearchResults(for searchController: UISearchController) {
        
        }
    
    // MARK: - Search bar delegate
    
    // Make sure search results change upon changing the search scope
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {

    }
}

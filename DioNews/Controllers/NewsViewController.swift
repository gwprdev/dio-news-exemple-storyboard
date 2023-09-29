//
//  NewsViewController.swift
//  DioNews
//
//  Created by Gilvan Wemerson on 27/09/23.
//

import WebKit

class NewsViewController: UIViewController {
    @IBOutlet weak var newsWebView: WKWebView!
    @IBOutlet weak var loadingActivityIndicator: UIActivityIndicatorView!
    
    var news: NewsModel? {
        didSet {
            self.title = news?.source.name
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebView()

    }
    
    private func setupWebView() {
        guard let news = news, let url = URL(string: news.url) else { return }
        self.newsWebView.navigationDelegate = self
        self.newsWebView.load(URLRequest(url: url))
        self.newsWebView.allowsBackForwardNavigationGestures = true
        
    }

}

extension NewsViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.loadingActivityIndicator.startAnimating()
        self.loadingActivityIndicator.isHidden = false
    }
 
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.loadingActivityIndicator.isHidden = true
        self.loadingActivityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.loadingActivityIndicator.isHidden = true
        self.loadingActivityIndicator.stopAnimating()
    }
}

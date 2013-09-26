class SettingsScreen < PM::Screen
  title "Settings"
  
  def will_appear
    set_attributes self.view, {
      backgroundColor: UIColor.whiteColor
    }

    # Create the back button
    back_btn = UIButton.buttonWithType(UIButtonTypeCustom)
    back_btn.setImage(UIImage.imageNamed('nav_bar_back'), forState: UIControlStateNormal)
    size = UIImage.imageNamed('nav_bar_back').size
    back_btn.frame = CGRectMake(0, 0, size.width, size.height)
    back_btn.addTarget(self, action: :back, forControlEvents: UIControlEventTouchUpInside)
    @left_item = UIBarButtonItem.alloc.initWithCustomView(back_btn)
    self.navigationItem.leftBarButtonItem = @left_item

    # Add some content
    @html = UIWebView.alloc.initWithFrame(self.view.bounds)
    @html.loadHTMLString("<pre>Lorem\nipsum\ndolor\nsit\namet</pre>", baseURL:nil)
    @html.delegate = self
    add @html
  end

  def back
    close to_screen: self.navigation_controller.viewControllers.first
  end
end
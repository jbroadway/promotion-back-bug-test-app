class HomeScreen < PM::Screen
  title 'Home'
  
  def will_appear
    set_attributes self.view, {
      backgroundColor: UIColor.whiteColor
    }

    # Create the settings button
    settings_btn = UIButton.buttonWithType(UIButtonTypeCustom)
    settings_btn.setImage(UIImage.imageNamed('nav_bar_settings'), forState: UIControlStateNormal)
    size = UIImage.imageNamed('nav_bar_settings').size
    settings_btn.frame = CGRectMake(0, 0, size.width, size.height)
    settings_btn.addTarget(self, action: :settings, forControlEvents: UIControlEventTouchUpInside)
    @right_item = UIBarButtonItem.alloc.initWithCustomView(settings_btn)
    self.navigationItem.rightBarButtonItem = @right_item

    # Add some content
    @html = UIWebView.alloc.initWithFrame(self.view.bounds)
    @html.loadHTMLString("<pre>Lorem\nipsum\ndolor\nsit\namet</pre>", baseURL:nil)
    @html.delegate = self
    add @html
  end
  
  def settings
    open SettingsScreen.new(nav_bar: true)
  end
end
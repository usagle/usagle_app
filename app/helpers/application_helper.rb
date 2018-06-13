module ApplicationHelper
  def bootstrap_class_for(name)
    { success: 'alert-success',
      error:  'alert-danger',
      danger: 'alert-danger',
      alert:  'alert-warning',
      notice: 'alert-info' }[name.to_sym] || name
  end

  def full_title(page_title = '')
    base_title = 'Usagle. The new age marketplace' 
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

end

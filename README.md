037 Simple Search Form
======================

Followed along with Railscast 037 Simple Search Form

[Blog Post](http://patrickperey.com/railscast-037-simple-search-form) @ [PatrickPerey.com](http://patrickperey.com)

```erb
<%= form_tag projects_path, method: :get do %>
<p>
  <%= text_field_tag :search, params[:search] %>
  <%= submit_tag 'Search', name: nil %>
</p>
<% end %>
```

```ruby
def index
  @projects = Project.search(params[:search])
end
```

```ruby
class Project < ActiveRecord::Base
  def self.search(search)
    if search
      if Rails.env.development?
        where("name LIKE ?", "%#{search}%")
      elsif Rails.env.production?
        where("name ILIKE ?", "%#{search}%")
      end
    else
      all
    end
  end
endd
```

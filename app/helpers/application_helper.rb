module ApplicationHelper
  def format_json(hash)
    CodeRay.scan(JSON.pretty_generate(hash), :json).div.html_safe if hash
  end
end

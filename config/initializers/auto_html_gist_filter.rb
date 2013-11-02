AutoHtml.add_filter(:new_gist).with({}) do |text, options|
  regex = /https:\/\/gist\.github\.com\/(\w+)\/(\w+)/
  text.gsub(regex) do
    gist_account = $1
    gist_id = $2
    %{<script src="https://gist.github.com/#{gist_account}/#{gist_id}.js"></script>}
  end
end
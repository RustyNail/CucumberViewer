CucumberViewer.helpers do
  def feature_dir
    File.expand_path('features', Padrino.root)
  end

  def get_feature_name
    files = []
    Dir::foreach(feature_dir) { |f| files.push $& if f =~ /^.*\.feature$/ }
    files.sort
  end

  def get_data(file)
    data = { 'Scenario' => [], 'Feature' => [] }
    f = open("#{feature_dir}/#{file}")
    while line = f.gets
      target = $& if line =~ /^(Feature|Scenario)/
      data[target].push line if target && line !~ /@/
    end
    data
  end

  def split_key(target)
    keyword = YAML.load_file(File.expand_path('config/cucumber.yml', Padrino.root))
    keyword.map do |kw|
      return { :key => kw, :other => target.gsub(kw,'') } if target.include? kw
    end
    return { :key => '', :other => target }
  end
end

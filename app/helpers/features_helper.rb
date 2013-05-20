# -*- encoding: utf-8 -*-
#
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
    reg = lang == 'en' ? ['Feature','Scenario'] : ['機能','シナリオ']
    while line = f.gets
      target = $& if line =~ /^(#{reg.join('|')})/
      case target
      when 'Feature', '機能'
        data['Feature'].push line if target && line !~ /@/
      when 'Scenario', 'シナリオ'
        data['Scenario'].push line if target && line !~ /@/
      end
    end
    data
  end

  def lang
    return ENV['CUCUMBER_LANG'] || 'en' 
  end

  def split_key(target)
    keyword = YAML.load_file(File.expand_path('config/cucumber.yml', Padrino.root))
    keyword[lang].map do |kw|
      return { :key => kw, :other => target.gsub(kw,'') } if target.include? kw
    end
    return { :key => '', :other => target }
  end
end

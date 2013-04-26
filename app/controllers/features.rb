# encoding: utf-8
require 'yaml'

CucumberViewer.controllers :features do
  get :index, :map => '/' do
    slim :"features/index"
  end
end

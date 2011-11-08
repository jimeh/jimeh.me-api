require 'yaml'

class DataSet

  class << self

    def initialize!(root_path)
      @root_path = root_path
      Dir["#{root_path}/**/*.yml"].each do |file|
        dataset = self.new(file)
        datasets[dataset.uid] = dataset
      end
    end

    attr_reader :root_path

    def all
      @all ||= datasets.values
    end

    def [](id)
      datasets[id]
    end

    def datasets
      @datasets ||= {}
    end

  end # << self

  def initialize(file)
    @file = file
  end

  attr_reader :file

  def filename
    @filename ||= file.gsub("#{self.class.root_path}/", '')
  end

  def source
    @raw ||= File.read(file)
  end

  def data
    @data ||= YAML.load(source)
  end

  def uid
    @uid ||= filename.match(/^(.+)\.yml$/)[1]
  end

end # Meta

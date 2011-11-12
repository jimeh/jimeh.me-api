require 'app/models/data_set'

class About
  def self.[](key)
    DataSet['about'].data[key.to_s]
  end
end

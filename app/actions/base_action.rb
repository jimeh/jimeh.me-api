require 'erb'
require 'yajl'

class BaseAction < Cramp::Action

  def self.content_type(type = nil)
    @content_type = type if type

    # Ensure default content type is application/json if none is set.
    @content_type = 'application/json' unless @content_type
    @content_type
  end

  def respond_with
    [200, {'Content-Type' => "#{content_type}; charset=utf-8"}]
  end

  private

  def jsonify(object, pretty = true)
    Yajl::Encoder.encode(object, :pretty => pretty)
  end

  def not_found!
    halt(
      404,
      {'Content-Type' => 'application/json; charset=utf-8'},
      jsonify(
        {:error => {:type => "NotFound", :message => "Resource not found."}}
      )
    )
  end

  def content_type
    self.class.content_type
  end

  def render_as_json(hash, *args)
    render jsonify(hash), *args
  end

end

require 'yajl'

module Api
  class Base < Cramp::Action

    def respond_with
      [200, {'Content-Type' => 'application/json'}]
    end

    private

    def render_json(hash)
      render Yajl::Encoder.encode(hash, :pretty => true)
    end

  end
end

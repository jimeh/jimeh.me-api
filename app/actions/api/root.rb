module Api
  class Root < Base

    def start
      render_json(:message => 'Welcome to my API.')
      finish
    end

  end
end

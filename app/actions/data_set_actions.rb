require 'app/actions/base_action'

module DataSetActions

  class Show < BaseAction
    before_start :check_dataset_id

    def start
      render_as_json DataSet[params[:id]].data
      finish
    end

    def check_dataset_id
      params[:id] = params[:id].join('/')
      if !DataSet.datasets.has_key?(params[:id])
        not_found!
      else
        yield
      end
    end
  end # Show

end

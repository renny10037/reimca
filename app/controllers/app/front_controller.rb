module App
  # FrontsController
  class FrontController < AppController
    layout 'layouts/templates/application'
    skip_before_filter :verify_authenticity_token
    before_action :message

    def index
      @message = KepplerContactUs::Message.new
      @works = Work.all
    end
    def projects
      @works = Work.all
      @type_projects = TypeProject.all
    end
    def type_project
      @works = Work.all
      @type_project = TypeProject.find(params[:type_project_id])
      respond_to do |format|
        format.js {}
      end
    end
    def projectdetails
      @work = Work.find(params[:work_id])
    end

    private 
    
    def message
      @message = KepplerContactUs::Message.new
    end

  end
end

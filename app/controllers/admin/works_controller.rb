module Admin
  # WorksController
  class WorksController < AdminController
    before_action :set_work, only: [:show, :edit, :update, :destroy]
    before_action :show_history, only: [:index]
    before_action :type_project

    def type_project
      @type_projects = []
      TypeProject.all.each do |type_project|
        if type_project.id != 1
          @type_projects << type_project
        end
      end
     
    end


    # GET /works
    def index
      @q = Work.ransack(params[:q])
      works = @q.result(distinct: true)
      @objects = works.page(@current_page)
      @total = works.size
      if !@objects.first_page? && @objects.size.zero?
        redirect_to works_path(page: @current_page.to_i.pred, search: @query)
      end
    end

    # GET /works/1
    def show
    end

    # GET /works/new
    def new
      @work = Work.new
    end

    def state
      @cities = []
      @state = StackState.find(params[:stack_state_id])
      respond_to do |format|
        format.js {}
      end
      @state.stack_cities.each do |city|
        @cities << city
      end
    end

    # GET /works/1/edit
    def edit
    end

    # POST /works
    def create
      @work = Work.new(work_params)

      if @work.save
        redirect(@work, params)
      else
        render :new
      end
    end

    # PATCH/PUT /works/1
    def update
      if @work.update(work_params)
        redirect(@work, params)
      else
        render :edit
      end
    end

    def clone
      @work = Work.clone_record params[:work_id]

      if @work.save
        redirect_to admin_works_path
      else
        render :new
      end
    end

    # DELETE /works/1
    def destroy
      @work.destroy
      redirect_to admin_works_path, notice: actions_messages(@work)
    end

    def destroy_multiple
      Work.destroy redefine_ids(params[:multiple_ids])
      redirect_to(
        admin_works_path(page: @current_page, search: @query),
        notice: actions_messages(Work.new)
      )
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def work_params
      params.require(:work).permit(:title, :description, :stack_state_id, :stack_city_id, :type_project_id, :contractor, :duration, :image)
    end

    def show_history
      get_history(Work)
    end
  end
end

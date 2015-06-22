class SpecsController < ApplicationController

	before_action :set_spec, only: [:show, :edit, :update, :destroy]
	before_action :confirm_admin, only: [:edit, :update, :destroy]

	def index
		@specs = Spec.all

		if params[:search]
			@specs = Spec.search(params[:search])
		end
	end

	def show
		
	end

	def edit

	end

	def update
    	if @spec.update_attributes(spec_params)
      		flash[:success] = "Saved Spec item."
      		redirect_to specs_path
    	else
      		flash[:error] = "That spec could not be saved."
      		render action: :edit
   		 end
	end

	def new
		@spec = Spec.new
	end

	def create
		@spec = Spec.new(spec_params)
	    if @spec.save
	      flash[:success] = "Added Spec."
	      redirect_to specs_path
	    else
	      flash[:error] = "There was a problem adding that todo spec."
	      render action: :new
	    end
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_spec
      @spec = Spec.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spec_params
      params.require(:spec).permit(:title, :content, :image)
    end

    # For CRUD operations on specs, the user must be an admin.
    def confirm_admin
    	unless User.find_by(id: session[:user_id]).admin?
  			render action: :show, notice:"You are not allowed to change this."
  		end
  	end
end

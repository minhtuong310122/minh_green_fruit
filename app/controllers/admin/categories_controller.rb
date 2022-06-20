class Admin::CategoriesController < Admin::AdminController
	before_action :set_categories, only: [:edit, :update, :destroy]

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new params_categories
		if @category.save
			redirect_to admin_categories_path
		else
			render :new
		end
	end

	def edit; end

	def update
		if @category.update params_categories
			redirect_to admin_categories_path
		else
			render :edit
		end
	end

	def destroy
		@category.destroy!
		redirect_to admin_categories_path
	end

	private

	def set_categories
		@category = Category.find_by id: params[:id]
	end

	def params_categories
		params.require(:category).permit :name
	end
end

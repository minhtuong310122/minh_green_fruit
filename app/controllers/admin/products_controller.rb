class Admin::ProductsController < Admin::AdminController
	before_action :set_products, only: [:show, :edit, :update, :destroy]

	def index
		@products = Product.all
	end

	def show;	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new params_products
		if @product.save
			redirect_to admin_product_path(@product)
		else
			render :new
		end
	end

	def edit; end

	def update
		if @product.update params_products
			redirect_to admin_product_path(@product)
		else
			render :edit
		end
	end

	def destroy
		@product.destroy!
		redirect_to admin_products_path
	end

	private

	def set_products
		@product = Product.find_by id: params[:id]
	end

	def params_products
		params.require(:product).permit :name, :price, :quantity, :description, :image, :category_id
	end
end

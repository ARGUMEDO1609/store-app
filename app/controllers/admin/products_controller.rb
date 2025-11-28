class Admin::ProductsController < AdminController
  before_action :set_admin_product, only: %i[show edit update destroy]

  def index
    @admin_products = Product.all
  end

  def show
  end

  def new
    @admin_product = Product.new
  end

  def edit
  end

  def create
    @admin_product = Product.new(product_params)

    respond_to do |format|
      if @admin_product.save
        format.html { redirect_to admin_product_path(@admin_product), notice: "Product was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_product.update(product_params)
        format.html { redirect_to admin_product_path(@admin_product), notice: "Product was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_product.destroy!

    respond_to do |format|
      format.html { redirect_to admin_products_path, notice: "Product was successfully destroyed.", status: :see_other }
    end
  end

  private

  
    def set_admin_product
      @admin_product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :category_id)
    end
end
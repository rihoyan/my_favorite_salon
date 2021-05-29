class Customers::CustomersController < Customers::ApplicationController

  def show
    @customer = current_customer
  end

  def confirm
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    if customer.update(customer_params)
      redirect_to customers_path, success: "更新しました"
    else
      render 'edit', danger: "更新に失敗しました"
    end
  end

  def destroy
    customer = current_customer
    if customer.update(active: false)
      reset_session
      redirect_to root_path
    else
      render 'confirm', danger: "退会処理に失敗しました"
    end
  end

  private

    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :telephone_number, :email)
    end
end

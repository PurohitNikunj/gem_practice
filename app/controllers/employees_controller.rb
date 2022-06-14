class EmployeesController < ApplicationController
  def new
    @employee = Employee.new 
  end

  def create
    @employee = Employee.new(emp_params)
    @employee.user_id = current_user.id
    if @employee.save
      redirect_to root_path
    else
       render :new, status: :unprocessable_entity
    end
  end

  private
  def emp_params
    params.require(:employee).permit(:name, :email, :password, :password_confirmation, :gender, :birth_date)
  end

end

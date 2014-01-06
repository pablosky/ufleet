require 'test_helper'

class DriversControllerTest < ActionController::TestCase
  setup do
    @driver = drivers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drivers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create driver" do
    assert_difference('Driver.count') do
      post :create, driver: { apellidomaterno: @driver.apellidomaterno, apellidopaterno: @driver.apellidopaterno, cargo: @driver.cargo, celular: @driver.celular, ci: @driver.ci, estadochofer: @driver.estadochofer, nombre: @driver.nombre }
    end

    assert_redirected_to driver_path(assigns(:driver))
  end

  test "should show driver" do
    get :show, id: @driver
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @driver
    assert_response :success
  end

  test "should update driver" do
    patch :update, id: @driver, driver: { apellidomaterno: @driver.apellidomaterno, apellidopaterno: @driver.apellidopaterno, cargo: @driver.cargo, celular: @driver.celular, ci: @driver.ci, estadochofer: @driver.estadochofer, nombre: @driver.nombre }
    assert_redirected_to driver_path(assigns(:driver))
  end

  test "should destroy driver" do
    assert_difference('Driver.count', -1) do
      delete :destroy, id: @driver
    end

    assert_redirected_to drivers_path
  end
end

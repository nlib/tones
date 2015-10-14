require 'test_helper'

module Tones
  class TonesControllerTest < ActionController::TestCase
    setup do
      @tone = tones_tones(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:tones)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create tone" do
      assert_difference('Tone.count') do
        post :create, tone: { body: @tone.body, de_body: @tone.de_body, de_short: @tone.de_short, description: @tone.description, name: @tone.name, short: @tone.short }
      end

      assert_redirected_to tone_path(assigns(:tone))
    end

    test "should show tone" do
      get :show, id: @tone
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @tone
      assert_response :success
    end

    test "should update tone" do
      patch :update, id: @tone, tone: { body: @tone.body, de_body: @tone.de_body, de_short: @tone.de_short, description: @tone.description, name: @tone.name, short: @tone.short }
      assert_redirected_to tone_path(assigns(:tone))
    end

    test "should destroy tone" do
      assert_difference('Tone.count', -1) do
        delete :destroy, id: @tone
      end

      assert_redirected_to tones_path
    end
  end
end

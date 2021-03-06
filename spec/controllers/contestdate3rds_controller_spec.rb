require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe Contestdate3rdsController do

  # This should return the minimal set of attributes required to create a valid
  # Contestdate3rd. As you add validations to Contestdate3rd, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "order" => "1" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Contestdate3rdsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all contestdate3rds as @contestdate3rds" do
      contestdate3rd = Contestdate3rd.create! valid_attributes
      get :index, {}, valid_session
      assigns(:contestdate3rds).should eq([contestdate3rd])
    end
  end

  describe "GET show" do
    it "assigns the requested contestdate3rd as @contestdate3rd" do
      contestdate3rd = Contestdate3rd.create! valid_attributes
      get :show, {:id => contestdate3rd.to_param}, valid_session
      assigns(:contestdate3rd).should eq(contestdate3rd)
    end
  end

  describe "GET new" do
    it "assigns a new contestdate3rd as @contestdate3rd" do
      get :new, {}, valid_session
      assigns(:contestdate3rd).should be_a_new(Contestdate3rd)
    end
  end

  describe "GET edit" do
    it "assigns the requested contestdate3rd as @contestdate3rd" do
      contestdate3rd = Contestdate3rd.create! valid_attributes
      get :edit, {:id => contestdate3rd.to_param}, valid_session
      assigns(:contestdate3rd).should eq(contestdate3rd)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Contestdate3rd" do
        expect {
          post :create, {:contestdate3rd => valid_attributes}, valid_session
        }.to change(Contestdate3rd, :count).by(1)
      end

      it "assigns a newly created contestdate3rd as @contestdate3rd" do
        post :create, {:contestdate3rd => valid_attributes}, valid_session
        assigns(:contestdate3rd).should be_a(Contestdate3rd)
        assigns(:contestdate3rd).should be_persisted
      end

      it "redirects to the created contestdate3rd" do
        post :create, {:contestdate3rd => valid_attributes}, valid_session
        response.should redirect_to(Contestdate3rd.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved contestdate3rd as @contestdate3rd" do
        # Trigger the behavior that occurs when invalid params are submitted
        Contestdate3rd.any_instance.stub(:save).and_return(false)
        post :create, {:contestdate3rd => { "order" => "invalid value" }}, valid_session
        assigns(:contestdate3rd).should be_a_new(Contestdate3rd)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Contestdate3rd.any_instance.stub(:save).and_return(false)
        post :create, {:contestdate3rd => { "order" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested contestdate3rd" do
        contestdate3rd = Contestdate3rd.create! valid_attributes
        # Assuming there are no other contestdate3rds in the database, this
        # specifies that the Contestdate3rd created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Contestdate3rd.any_instance.should_receive(:update_attributes).with({ "order" => "1" })
        put :update, {:id => contestdate3rd.to_param, :contestdate3rd => { "order" => "1" }}, valid_session
      end

      it "assigns the requested contestdate3rd as @contestdate3rd" do
        contestdate3rd = Contestdate3rd.create! valid_attributes
        put :update, {:id => contestdate3rd.to_param, :contestdate3rd => valid_attributes}, valid_session
        assigns(:contestdate3rd).should eq(contestdate3rd)
      end

      it "redirects to the contestdate3rd" do
        contestdate3rd = Contestdate3rd.create! valid_attributes
        put :update, {:id => contestdate3rd.to_param, :contestdate3rd => valid_attributes}, valid_session
        response.should redirect_to(contestdate3rd)
      end
    end

    describe "with invalid params" do
      it "assigns the contestdate3rd as @contestdate3rd" do
        contestdate3rd = Contestdate3rd.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Contestdate3rd.any_instance.stub(:save).and_return(false)
        put :update, {:id => contestdate3rd.to_param, :contestdate3rd => { "order" => "invalid value" }}, valid_session
        assigns(:contestdate3rd).should eq(contestdate3rd)
      end

      it "re-renders the 'edit' template" do
        contestdate3rd = Contestdate3rd.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Contestdate3rd.any_instance.stub(:save).and_return(false)
        put :update, {:id => contestdate3rd.to_param, :contestdate3rd => { "order" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested contestdate3rd" do
      contestdate3rd = Contestdate3rd.create! valid_attributes
      expect {
        delete :destroy, {:id => contestdate3rd.to_param}, valid_session
      }.to change(Contestdate3rd, :count).by(-1)
    end

    it "redirects to the contestdate3rds list" do
      contestdate3rd = Contestdate3rd.create! valid_attributes
      delete :destroy, {:id => contestdate3rd.to_param}, valid_session
      response.should redirect_to(contestdate3rds_url)
    end
  end

end

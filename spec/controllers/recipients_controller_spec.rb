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

describe RecipientsController do

  # This should return the minimal set of attributes required to create a valid
  # Recipient. As you add validations to Recipient, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all recipients as @recipients" do
      recipient = Recipient.create! valid_attributes
      get :index
      assigns(:recipients).should eq([recipient])
    end
  end

  describe "GET show" do
    it "assigns the requested recipient as @recipient" do
      recipient = Recipient.create! valid_attributes
      get :show, :id => recipient.id
      assigns(:recipient).should eq(recipient)
    end
  end

  describe "GET new" do
    it "assigns a new recipient as @recipient" do
      get :new
      assigns(:recipient).should be_a_new(Recipient)
    end
  end

  describe "GET edit" do
    it "assigns the requested recipient as @recipient" do
      recipient = Recipient.create! valid_attributes
      get :edit, :id => recipient.id
      assigns(:recipient).should eq(recipient)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Recipient" do
        expect {
          post :create, :recipient => valid_attributes
        }.to change(Recipient, :count).by(1)
      end

      it "assigns a newly created recipient as @recipient" do
        post :create, :recipient => valid_attributes
        assigns(:recipient).should be_a(Recipient)
        assigns(:recipient).should be_persisted
      end

      it "redirects to the created recipient" do
        post :create, :recipient => valid_attributes
        response.should redirect_to(Recipient.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved recipient as @recipient" do
        # Trigger the behavior that occurs when invalid params are submitted
        Recipient.any_instance.stub(:save).and_return(false)
        post :create, :recipient => {}
        assigns(:recipient).should be_a_new(Recipient)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Recipient.any_instance.stub(:save).and_return(false)
        post :create, :recipient => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested recipient" do
        recipient = Recipient.create! valid_attributes
        # Assuming there are no other recipients in the database, this
        # specifies that the Recipient created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Recipient.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => recipient.id, :recipient => {'these' => 'params'}
      end

      it "assigns the requested recipient as @recipient" do
        recipient = Recipient.create! valid_attributes
        put :update, :id => recipient.id, :recipient => valid_attributes
        assigns(:recipient).should eq(recipient)
      end

      it "redirects to the recipient" do
        recipient = Recipient.create! valid_attributes
        put :update, :id => recipient.id, :recipient => valid_attributes
        response.should redirect_to(recipient)
      end
    end

    describe "with invalid params" do
      it "assigns the recipient as @recipient" do
        recipient = Recipient.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Recipient.any_instance.stub(:save).and_return(false)
        put :update, :id => recipient.id, :recipient => {}
        assigns(:recipient).should eq(recipient)
      end

      it "re-renders the 'edit' template" do
        recipient = Recipient.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Recipient.any_instance.stub(:save).and_return(false)
        put :update, :id => recipient.id, :recipient => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested recipient" do
      recipient = Recipient.create! valid_attributes
      expect {
        delete :destroy, :id => recipient.id
      }.to change(Recipient, :count).by(-1)
    end

    it "redirects to the recipients list" do
      recipient = Recipient.create! valid_attributes
      delete :destroy, :id => recipient.id
      response.should redirect_to(recipients_url)
    end
  end

end

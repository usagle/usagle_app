require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:category) { create(:category) }

  describe 'GET #index' do
    let(:categories) { create_list(:category, 2) }

    before do
      user = double('user')
      allow(controller).to receive(:authenticate_user!).and_return(true)
      allow(controller).to receive(:current_user).and_return(user)

      get :index
    end

    it 'populates an array of all categories' do
      expect(assigns(:categories)).to match_array(categories)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: category } }

    it 'assigns the requested category to @category' do
      expect(assigns(:category)).to eq category
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before do
      user = double('user')
      allow(controller).to receive(:authenticate_user!).and_return(true)
      allow(controller).to receive(:current_user).and_return(user)
      get :new
    end

    it 'assigns a new Category to @category' do
      expect(assigns(:category)).to be_a_new(Category)
    end

    it 'render new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before do
      user = double('user')
      allow(controller).to receive(:authenticate_user!).and_return(true)
      allow(controller).to receive(:current_user).and_return(user)
      get :edit, params: { id: category }
    end

    it 'assigns requested category to @category' do
      expect(assigns(:category)).to eq(category)
    end

    it 'renders edit template' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    before do
      user = double('user')
      allow(controller).to receive(:authenticate_user!).and_return(true)
      allow(controller).to receive(:current_user).and_return(user)
    end

    context 'with valid attributes' do
      it 'saves new category in the database' do
        expect { post :create, params: { category: attributes_for(:category) } }
          .to change(Category, :count).by(1)
      end
      it 'redirects to show view' do
        post :create, params: { category: attributes_for(:category) }
        expect(response).to redirect_to categories_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the category to db' do
        expect { post :create, params: { category: attributes_for(:invalid_category) } }
          .to_not change(Category, :count)
      end

      it 're-renders new view' do
        post :create, params: { category: attributes_for(:invalid_category) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before do
      user = double('user')
      allow(controller).to receive(:authenticate_user!).and_return(true)
      allow(controller).to receive(:current_user).and_return(user)
    end

    context 'with valid attributes' do
      let(:category) { create(:category) }

      before do
        patch :update, params: { id: category, category: attributes_for(:category) }
      end

      it 'assigns the requested category to @category' do
        expect(assigns(:category)).to eq category
      end

      it 'changes category attributes' do
        patch :update, params: { id: category, category: { name: 'Category new name' } }

        category.reload

        expect(category.name).to eq 'Category new name'
      end

      it 'redirects to the updated category' do
        expect(response).to redirect_to categories_path
      end
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: category, category: { name: 'Name for invalid category' } } }

      it 'does not change category attributes' do
        category.reload

        expect(category.name) == 'Lorem Ipsum'
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      user = double('user')
      allow(controller).to receive(:authenticate_user!).and_return(true)
      allow(controller).to receive(:current_user).and_return(user)
    end

    context 'delete by category' do
      let!(:category) { create(:category) }

      it 'deletes category' do
        expect { delete :destroy, params: { id: category } }
          .to change(Category, :count).by(-1)
      end

      it 'redirect to index view' do
        delete :destroy, params: { id: category }
        expect(response).to redirect_to categories_path
      end
    end
  end
end

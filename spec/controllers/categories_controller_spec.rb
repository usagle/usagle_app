require 'rails_helper'

describe CategoriesController do
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

    it 'assings the requested to @category' do
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

    it 'assings a new Category to @category' do
      expect(assigns(:category)).to be_a_new(Category)
    end

    it 'renders new view' do
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

    it 'assings the requested category to @category' do
      expect(assigns(:category)).to eq category
    end

    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end
end

require_relative 'rails_helper'
RSpec.describe MoviesController, type: :controller do
    before (:each) do
        @mock_movie_attributes = {:title => 'Space Balls', :release_date => '24/6/1987', :rating => 'PG'}
        @mock_movie = Movie.create!(@mock_movie_attributes)
    end
    
    describe "POST #create" do
      context "with valid attributes" do 
        it "saves the new movie in the database" do
            expect {
            post :create, movie: @mock_movie_attributes
            }.to change(Movie,:count).by(1)
        end
        it "assigns the saved movie to @movie" do
            post :create, movie: @mock_movie_attributes
            expect(assigns(:movie).title).to include("Space Balls")
        end
        it "redirects to the home page" do
            post :create, movie: @mock_movie_attributes
            expect(response).to redirect_to(:action => 'index')
        end
      end
    end
  
    describe "GET #show" do
      it "assigns the requested movie to @movie" do
        get :show, id: @mock_movie
        expect(assigns(:movie).title).to include("Space Balls")
      end
      it "renders the :show template" do
        get :show, id: @mock_movie
        expect(response).to render_template(:show)
      end
    end
  
    describe "PUT #update" do
      it "located the requested movie" do
        put :update, id: @mock_movie, movie: @mock_movie_attributes
        expect(assigns(:movie)).to eq(@mock_movie)
      end
      it "changed the requested movies attributes" do
        put :update, id: @mock_movie, movie: @mock_movie_attributes
        @mock_movie.reload
        expect(@mock_movie.title).to eq("Space Balls")
        expect(@mock_movie.rating).to eq("PG")
      end
      it "redirects to the updated movie" do
        put :update, id: @mock_movie, movie: @mock_movie_attributes
        expect(response).to redirect_to @contact
      end
    end
  
    describe "DELETE #destroy" do
      it "deletes the movie" do
        expect{
          delete :destroy, id: @mock_movie
        }.to change(Movie,:count).by(-1)
      end
      it "redirects to the main page " do
        delete :destroy, id: @mock_movie
        expect(response).to redirect_to(:action => 'index') 
      end
    end
end

RSpec.describe BooksController do
  describe "GET index" do
    it "assigns @books" do
      book = FactoryGirl.create(:book)
      get :index
      expect(assigns(:books)).to eq([book])
    end

    it "renders index template" do
      get :index
      expect(response).to render_template("index")
    end

  end

  describe "GET #show" do

    before :each do
      login_user
    end

    it "should show" do
      book = create(:book)
      get :show, id: book
      expect(assigns(:book)).to eq(book)
    end

    it "renders the #show view" do
      book = create(:book)
      get :show, id: book
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do

    # LOGIN USER CREATES @CURRENT_USER
    before :each do
      login_user
    end


    it "Assigns title, author, desc, to new book" do
      get :new
      expect(assigns(:current_user).books.first).to be_a_new(Book)
    end
  end


  describe "POST #create" do
    before :each do
      login_user
    end

    context "User signed Out" do
      it "does not create and redirects" do
        logout_user

        expect{
          post :create, book: FactoryGirl.attributes_for(
            :book, :invalid)
          }.to_not change(Book, :count)

        expect(response).to redirect_to new_user_session_path
      end
    end

    context "with valid attributes" do
      it "does create a new contact" do
        expect{
          post :create, book: FactoryGirl.attributes_for(
            :book)
        }.to change(Book, :count).by(1)
      end

      it "redirects to new book" do
        post :create, book: FactoryGirl.attributes_for(
          :book)
        expect(response).to redirect_to Book.last
      end
    end

    context "with invalid attributes" do
      it "does not create a new book" do
        expect{
          post :create, book: FactoryGirl.attributes_for(
            :book, :invalid)
          }.to_not change(Book, :count)
      end

      it "re-renders new method" do
        post :create, book: FactoryGirl.attributes_for(
          :book, :invalid)
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do
    # Before update, we must have user log in
    # and instantiate a book
    before :each do
      login_user
      @book = create(:book)
    end

    context "with Valid Attributes" do
      it "located the requested @book" do
        put :update, id: @book, book: FactoryGirl.attributes_for(
          :book)

        expect(assigns(:book)).to eq(@book)
      end

      it "changes @book attributes" do
        put :update, id: @book, book: FactoryGirl.attributes_for(
          :book, :updated)
        @book.reload
        expect(@book.title).to eq("Gone Home")
        expect(@book.author).to eq("A Woman")
      end

      it "redirects to updated book" do
        put :update, id: @book, book: FactoryGirl.attributes_for(
          :book, :updated)
        expect(response).to redirect_to @book
      end
    end

    context "with Invalid Attriutes" do
      it "locates the requested @book" do
        put :update, id: @book, book: FactoryGirl.attributes_for(
          :book, :invalid)

        expect(assigns(:book)).to eq(@book)
      end

      it "does not change @book attributes" do
        put :update, id: @book, book: FactoryGirl.attributes_for(
          :book, :invalid)

        @book.reload
        expect(@book.title).not_to eq("Gone Home")
        expect(@book.author).not_to eq("A Woman")
      end

      it "rerenders edit page" do
        put :update, id: @book, book: FactoryGirl.attributes_for(
          :book, :invalid)

        @book.reload
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      login_user
      @book = create(:book)
    end

    it "deletes the book" do
      expect {
        delete :destroy, id: @book
        }.to change(Book, :count).by(-1)
    end

    it "redirects to library" do
      delete :destroy, id: @book
      expect(response).to redirect_to books_path
    end
  end


end







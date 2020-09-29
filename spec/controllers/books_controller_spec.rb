require "rails_helper"

describe BooksController, type: :controller do
  it { is_expected.to use_before_action(:authenticate_user!) }

  let(:user) { create(:user) }
  before { sign_in(user) }

  describe "GET index" do
    it do
      get :index

      expect(response).to have_http_status(:ok)
    end

    it "returns books" do
      create_list(:book, 2, user: user)
      get :index

      expect(assigns(:books).size).to eq(2)
    end

    context "when parameter q is specified" do
      let!(:matching_title_book) { create(:book, title: "The Good struggle", user: user) }
      let!(:not_matching_title_book) { create(:book, title: "Bad book title", user: user) }

      it "returns books" do
        get :index, params: {
                  q: {
                    title_eq: "The Good struggle",
                  },
                }

        expect(assigns(:books)).to contain_exactly(matching_title_book)
      end
    end

    context "paginate books" do
      let!(:booklist) { create_list(:book, 11, user: user) }

      it "renders page 1" do
        get :index, params: {
                  page: 1,
                }

        expect(assigns(:books).size).to eq(10)
      end

      it "renders page 2" do
        get :index, params: {
                  page: 2,
                }

        expect(assigns(:books).size).to eq(1)
      end

      it "renders page without params" do
        get :index

        expect(assigns(:books).size).to eq(10)
      end
    end
  end

  describe "GET new" do
    it "render new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do
    context "when successfully create book" do
      let(:params) do
        {
          book: {
            title: "Book title",
            description: "Book Description",
          },
        }
      end

      it do
        post :create, params: params
        expect(response).to redirect_to(books_path)
      end
    end

    context "when unsuccessfully create book" do
      let(:params) do
        {
          book: {
            title: title,
            description: "Book Description",
          }
        }
      end

      context "with title is nil" do
        let(:title) { nil }

        it do
          post :create, params: params
          expect(response).to render_template(:new)
        end
      end

      context "with title is nil" do
        let(:title) { "" }

        it do
          post :create, params: params
          expect(response).to render_template(:new)
        end
      end
    end
  end

  describe "GET edit" do
    context "with existing book id" do
      it do
        book = create(:book, user: user)

        get :edit, params: {
          id: book.id
        }

        expect(response).to render_template(:edit)
        expect(assigns(:book)).to eq(book)
      end
    end

    context "with non-existing book id " do
      it do
        expect do
          get :edit, params: {
            id: "UNKNOW BOOK ID"
          }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context "with book id belongs to other author" do
      it do
        book = create(:book)

        expect do
          get :edit, params: {
            id: book.id
          }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end

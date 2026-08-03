require "rails_helper"

RSpec.describe "お知らせ管理", type: :request do
  describe "GET /notices" do
    it "一覧画面を表示できること" do
      get notices_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /notices/new" do
    it "新規作成画面を表示できること" do
      get new_notice_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /notices" do
    it "お知らせを作成できること" do
      expect do
        post notices_path, params: { notice: { title: "New notice", body: "New body" } }
      end.to change(Notice, :count).by(1)

      expect(response).to redirect_to(notice_path(Notice.last))
    end
  end

  describe "GET /notices/:id" do
    it "詳細画面を表示できること" do
      notice = Notice.create!(title: "First notice", body: "This is the first notice.")

      get notice_path(notice)

      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /notices/:id/edit" do
    it "編集画面を表示できること" do
      notice = Notice.create!(title: "First notice", body: "This is the first notice.")

      get edit_notice_path(notice)

      expect(response).to have_http_status(:ok)
    end
  end

  describe "PATCH /notices/:id" do
    it "お知らせを更新できること" do
      notice = Notice.create!(title: "First notice", body: "This is the first notice.")

      patch notice_path(notice), params: { notice: { title: "Updated notice", body: "Updated body" } }

      expect(response).to redirect_to(notice_path(notice))
      expect(notice.reload).to have_attributes(title: "Updated notice", body: "Updated body")
    end
  end

  describe "DELETE /notices/:id" do
    it "お知らせを削除できること" do
      notice = Notice.create!(title: "First notice", body: "This is the first notice.")

      expect do
        delete notice_path(notice)
      end.to change(Notice, :count).by(-1)

      expect(response).to redirect_to(notices_path)
    end
  end
end

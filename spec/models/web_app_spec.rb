require 'rails_helper'

RSpec.describe WebApp, type: :model do
  before do
    @web_app = FactoryBot.build(:web_app)
  end

  describe 'ウェブアプリ投稿' do
    context 'ウェブアプリ投稿できるとき' do
      it '必要事項を入力すれば登録できる' do
        expect(@web_app).to be_valid
      end
    end

    context 'ウェブアプリ投稿できないとき' do
      it 'nameが空欄だと投稿できない' do
        @web_app.name = ''
        @web_app.valid?
        expect(@web_app.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空欄だと投稿できない' do
        @web_app.description = ''
        @web_app.valid?
        expect(@web_app.errors.full_messages).to include("Description can't be blank")
      end
      it 'languageが空欄だと投稿できない' do
        @web_app.language = ''
        @web_app.valid?
        expect(@web_app.errors.full_messages).to include("Language can't be blank")
      end
      it 'freeが空欄だと投稿できない' do
        @web_app.free = ''
        @web_app.valid?
        expect(@web_app.errors.full_messages).to include("Free can't be blank")
      end
      it 'linkが空欄だと投稿できない' do
        @web_app.link = ''
        @web_app.valid?
        expect(@web_app.errors.full_messages).to include("Link can't be blank")
      end
      it 'edit_countが空欄だと投稿できない' do
        @web_app.edit_count = ''
        @web_app.valid?
        expect(@web_app.errors.full_messages).to include("Edit count can't be blank")
      end
      it 'edit_countが英字だと投稿できない' do
        @web_app.edit_count = 'a'
        @web_app.valid?
        expect(@web_app.errors.full_messages).to include('Edit count is invalid. edit_count must be 0-99 and half-width characters')
      end
      it 'edit_countが全角だと投稿できない' do
        @web_app.edit_count = '１'
        @web_app.valid?
        expect(@web_app.errors.full_messages).to include('Edit count is invalid. edit_count must be 0-99 and half-width characters')
      end
      it 'edit_countが負だと投稿できない' do
        @web_app.edit_count = '-1'
        @web_app.valid?
        expect(@web_app.errors.full_messages).to include('Edit count is invalid. edit_count must be 0-99 and half-width characters')
      end
      it 'edit_countが100以上だと投稿できない' do
        @web_app.edit_count = '100'
        @web_app.valid?
        expect(@web_app.errors.full_messages).to include('Edit count is invalid. edit_count must be 0-99 and half-width characters')
      end
      it 'imageが添付されていないと投稿できない' do
        @web_app.image = nil
        @web_app.valid?
        expect(@web_app.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐づいていないと投稿できない' do
        @web_app.user = nil
        @web_app.valid?
        expect(@web_app.errors.full_messages).to include('User must exist')
      end
    end
  end
end

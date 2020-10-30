require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build (:user)
  end

  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit user_registration_path
      # ユーザー情報を入力する
      fill_in 'ニックネーム', with: @user.nickname
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      fill_in 'パスワード(確認)', with: @user.password_confirmation
      fill_in 'お名前(全角)', with: @user.last_name
      fill_in 'お名前(全角)', with: @user.fast_name
      fill_in 'お名前カナ(全角)', with: @user.last_name_kana
      fill_in 'お名前カナ(全角)', with: @user.fast_name_kana
      fill_in '生年月日', with: @user.user_birth_date_1i
      fill_in '生年月日', with: @user.user_birth_date_2i
      fill_in '生年月日', with: @user.user_birth_date_3i
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      # トップページへ遷移する
      # カーソルを合わせるとログアウトボタンが表示されることを確認する
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      # 新規登録ページへ移動する
      # ユーザー情報を入力する
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      # 新規登録ページへ戻されることを確認する
    end
  end
end

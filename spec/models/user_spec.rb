require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation,last_nameとfast_name,last_name_kanaとfast_name_kana,birth_dateが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
     it "nicknameが40文字以上であれば登録できない" do
        @user.nickname = "a" * 41
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 40 characters)")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailは@を含んだ半角英数字で入力されていない場合登録できない" do
        @user.email = "おおお.gmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であると登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英数字混合で入力されていない場合登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが半角英数字では登録できない" do
        @user.last_name = "sasaki"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "fast_nameが空では登録できない" do
        @user.fast_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Fast name can't be blank")
      end
      it "fast_nameが半角英数字では登録できない" do
        @user.fast_name = "sasaki"
        @user.valid?
        expect(@user.errors.full_messages).to include("Fast name is invalid")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "last_name_kanaが半角英数字では登録できない" do
        @user.last_name_kana = "ｽｽﾞｷ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "fast_name_kanaが空では登録できない" do
        @user.fast_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Fast name kana can't be blank")
      end
      it "fast_name_kanaが半角英数字では登録できない" do
        @user.fast_name_kana = "ｽｽﾞｷ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Fast name kana is invalid")
      end
      it "birth_dateが空では登録できない" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end 
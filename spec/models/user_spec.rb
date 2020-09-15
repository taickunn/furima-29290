require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

    describe 'ユーザー新規登録ができる場合' do
        it 'nicknameとfamily_nameとfirst_nameとfamily_name_kanaとfirst_name_kanaとbirth_dayとemailとpasswordとpassword_confirmationが存在していれば保存できること' do
          expect(@user).to be_valid
          end

        it 'passwordが6文字以上であれば登録できる' do
          @user.password = "abc123"
          @user.password_confirmation = "abc123"
          expect(@user).to be_valid
          end

        it "passwordが英数字である場合は登録できる" do
          @user.password = "abc123"
          @user.password_confirmation = "abc123"
          expect(@user).to be_valid
          end
    
        it "emailが@を含んでる場合は登録できる" do
          @user.email = "xxxxx@gmail.com"
          @user.valid?
          expect(@user).to be_valid
          end

        it "family_nameが全角である場合は登録できる事" do
          @user.family_name = "山田"
          @user.valid?
          expect(@user).to be_valid
          end

        it "family_name_kanaが全角である場合は登録できる事"   do
          @user.family_name_kana = "ヤマダ"
          @user.valid?
          expect(@user).to be_valid
          end

        it "first_nameが全角である場合は登録できる事"do
          @user.first_name = "陸太郎"
          @user.valid?
          expect(@user).to be_valid
          end

        it "first_name_kanaが全角である場合は登録できる事" do
          @user.first_name_kana = "リクタロウ"
          @user.valid?
          expect(@user).to be_valid
          end
    end

    



    context 'ユーザー新規登録が出来ない場合' do
        it 'nicknameが空では登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

      it 'emailが空では登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'family_nameが空では登録できないこと' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'family_name_kanaが空では登録出来ない事' do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'first_nameが空では登録できないこと' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_name_kanaが空では登録出来ない事' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
  
      it 'birth_dayが無い場合は登録出来ない事' do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end

      it "passwordが5文字以下であれば登録出来ない事", "passwordが英数字でない場合登録出来ない時" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "emailが@を含んでいない場合は登録出来ない" do
        @user.email = "xxxxxgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "family_nameが全角でない場合は登録出来ない" do
        @user.family_name = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name は全角で入力してください。")
      end

      it "family_name_kanaが全角でない場合登録出来ない" do
        @user.family_name_kana = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana は全角カタカナで入力して下さい。")
      end

      it "first_nameが全角でない場合は登録出来ない" do
        @user.first_name = "ﾘｸﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角で入力してください。")
      end

      it "first_name_kanaが全角出ない場合は登録出来ない" do
        @user.first_name_kana ="ﾘｸﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana は全角カタカナで入力して下さい。")
      end
    end
end
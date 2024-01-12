

# app/admin/user.rb
ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, profile_attributes: [:id, :email,]  # Add other attributes as needed

  form do |f|
    f.inputs "User Details" do
      f.input :email

      f.inputs "Profile" do
        f.semantic_fields_for :profile do |profile_fields|
          profile_fields.input :email

        end
      end
    end
    f.actions
  end
end


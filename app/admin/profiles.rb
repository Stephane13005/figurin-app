ActiveAdmin.register Profile do
  index do
    selectable_column
    column :id
    column :username
    column :firstname
    column :lastname
    column :birthdate
    column :city
    column :photo do |profile|
      profile.photo.attached?
    end
    actions
  end

  form do |f|
    f.inputs "Identity" do
      f.input :username
      f.input :firstname
      f.input :lastname
      f.input :birthdate
      f.input :city
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :firstname, :lastname, :birthdate, :city, :username
  #
  # or
  #
  # permit_params do
  #   permitted = [:firstname, :lastname, :birthdate, :city, :username, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end

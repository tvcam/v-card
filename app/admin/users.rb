ActiveAdmin.register User do
  active_admin_import

  filter :khmer_name
  filter :english_name
  filter :position
  filter :primary_phone_number
  filter :s2_id
  filter :gender
  filter :email

  permit_params(
    :khmer_name,
    :english_name,
    :position,
    :address,
    :primary_phone_number,
    :secondary_phone_number,
    :email,
    :gender,
    :nickname,
    :s2_id
  )

  index do
    selectable_column
    id_column

    column :khmer_name
    column :english_name
    column :position
    column :primary_phone_number
    column :email
    column :gender
    column :nickname
    column :s2_id
    column :qr_code do |user|
      "<img src='#{user.qr_path}' width=50 heigh=50>".html_safe
    end

    actions do |user|
      link_to('Download QR Code', download_qr_admin_user_path(user), target: :_blank)
    end
  end

  show do
    attributes_table do
      row :s2_id
      row :khmer_name
      row :english_name
      row :position
      row :address
      row :primary_phone_number
      row :secondary_phone_number
      row :email
      row :gender
      row :nickname
    end

    panel 'QR Code' do
      "<img src='#{user.qr_path}' width=300 heigh=300>".html_safe
    end

    active_admin_comments
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs do
      f.input :s2_id
      f.input :khmer_name
      f.input :english_name
      f.input :position
      f.input :address
      f.input :primary_phone_number
      f.input :secondary_phone_number
      f.input :email
      f.input :gender
      f.input :nickname
    end

    f.actions
  end

  member_action :download_qr, method: :get do
    File.open("public#{resource.qr_path}", 'rb') do |f|
      send_data f.read, type: 'image/png', disposition: 'inline', filename: "#{resource.khmer_name}-qr-code.png"
    end
  end
end

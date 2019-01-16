ActiveAdmin.register ContactsPage do
  permit_params :meta_title_ru, :meta_title_en, :meta_title_uk,
                :meta_description_ru, :meta_description_en, :meta_description_uk,
                contacts_attributes: [:id, :contact_type, :value, :_destroy]

  menu label: 'Contacts', url: -> { url_for [:admin, :contacts_page] }

  actions :show, :edit, :update

  controller do
    defaults singleton: true

    def resource
      @resource ||= ContactsPage.instance
    end
  end

  form do |f|
    tabs do
      tab 'Russian' do
        f.inputs 'Meta' do
          f.input :meta_title_ru
          f.input :meta_description_ru
        end
      end

      tab 'English' do
        f.inputs 'Meta' do
          f.input :meta_title_en
          f.input :meta_description_en
        end
      end

      tab 'Ukranian' do
        f.inputs 'Meta' do
          f.input :meta_title_uk
          f.input :meta_description_uk
        end
      end
    end

    f.inputs 'Contacts' do
      f.has_many :contacts,
                  new_record: 'Add Contact',
                  allow_destroy: true do |b|
        b.input :order
        b.input :contact_type, as: :select, collection: Contact.contact_types.keys
        b.input :value
      end
    end

    f.actions do
      action :submit
      cancel_link [:admin, :contacts_page]
    end
  end
end

require "administrate/base_dashboard"

class UmkmDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    jenis_umkm: Field::BelongsTo,
    id: Field::Number,
    nama: Field::String,
    email: Field::String,
    nama_pemilik: Field::String,
    gambar: Field::Carrierwave.with_options(
      image: :standard
    ).freeze,
    alamat: Field::String,
    siup: Field::Carrierwave,
    logo: Field::String,
    kota: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    phone: Field::String,
    password: Field::String,
    point: Field::String
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  jenis_umkm
  id
  nama
  email
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  jenis_umkm
  id
  nama
  email
  nama_pemilik
  gambar
  alamat
  siup
  logo
  kota
  created_at
  updated_at
  phone
  password
  point
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  jenis_umkm
  nama
  email
  nama_pemilik
  gambar
  alamat
  siup
  logo
  kota
  phone
  password
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how umkms are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(umkm)
    "#{umkm.nama}"
  end
end

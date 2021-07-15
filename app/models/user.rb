class User < ApplicationRecord
  validates :khmer_name, presence: true

  before_create :set_token
  after_commit :generate_qr_code, on: :create

  def qr_path
    "/qr_code/#{self.token}.png"
  end

  def generate_qr_code
    qrcode = RQRCode::QRCode.new("#{Rails.application.credentials.production_host}/users/#{self.token}")
    
    # NOTE: showing with default options specified explicitly
    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 500
    )
    
    IO.binwrite("public#{qr_path}", png.to_s)
  end

  def increment_scanned_count!
    update_columns(scanned_count: (scanned_count + 1))
  end

  private

  def set_token
    self.token = generate_token
  end

  def generate_token
    loop do
      token = SecureRandom.hex(20)
      break token unless User.where(token: token).exists?
    end
  end
end

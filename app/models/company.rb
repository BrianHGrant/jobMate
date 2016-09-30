class Company < ActiveRecord::Base
  validates_presence_of :name, :address, :category
  has_many :contacts
  has_many :jobs
  belongs_to :user
  before_create :get_company_info

  private
  def get_company_info
    uri = URI.parse(domain) rescue nil
    if uri.host != nil
      binding.pry
      begin
          response = JSON.parse(RestClient::Request.new(
          method: :get,
          url: "https://api.fullcontact.com/v2/company/lookup.json",
          headers: {params: { apiKey: ENV['FULL_CONTACT_API_KEY'], domain: uri.host}}
          ).execute)
          organization = response['organization']
          contactInfo = organization['contactInfo']
          address = contactInfo['addresses']
          self.domain = uri.host
          self.name = organization['name']
          self.address = address[0]['addressLine1']
          self.city = address[0]['locality']
          region = address[0]['region']
          self.region = region['code']
          self.founded = organization['founded'].to_i
          self.size = organization['approxEmployees'].to_i
      rescue RestClient::BadRequest => error
        message = JSON.parse(error.response)['message']
        errors.add(:base, message)
        throw(:abort)
      end
    end
  end
end

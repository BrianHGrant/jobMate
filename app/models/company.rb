class Company < ActiveRecord::Base
  validates_presence_of :name, :address, :category
  has_many :contacts
  has_many :jobs
  belongs_to :user
  before_create :get_company_info

  private
  def get_company_info
    if domain.to_s && domain != ""
      begin
          response = JSON.parse(RestClient::Request.new(
          method: :get,
          url: "https://api.fullcontact.com/v2/company/lookup.json",
          headers: {params: { apiKey: "82d66c9534032f31", domain: domain}}
          ).execute)
          organization = response['organization']
          contactInfo = organization['contactInfo']
          address = contactInfo['addresses']
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

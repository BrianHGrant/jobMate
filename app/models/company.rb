class Company < ActiveRecord::Base
  validates_presence_of :name, :address, :category
  has_many :contacts
  has_many :jobs
  belongs_to :user
  before_create :get_company_info, :get_news
  serialize :news_response
  serialize :response
  private
  def get_company_info
    uri = URI.parse(domain) rescue nil
    if uri.host != nil
      begin
          response = JSON.parse(RestClient::Request.new(
          method: :get,
          url: "https://api.fullcontact.com/v2/company/lookup.json",
          headers: {params: { apiKey: ENV['FULL_CONTACT_API_KEY'], domain: uri.host}}
          ).execute)
          self.response = response
          organization = response['organization']
          contactInfo = organization['contactInfo']
          address = contactInfo['addresses']
          self.domain = uri.host
          self.name = organization['name']
          self.address = address[0]['addressLine1']
          self.city = address[0]['locality']
          if address[0]['region']
            region = address[0]['region']
            self.region = region['code']
          else
            region = address[0]['country']
            self.region = region['name']
          end
          self.founded = organization['founded'].to_i
          self.size = organization['approxEmployees'].to_i
      rescue RestClient::BadRequest => error
        message = JSON.parse(error.response)['message']
        errors.add(:base, message)
        throw(:abort)
      end
    end
  end

  def get_news
      uri = URI.parse("https://gateway-a.watsonplatform.net/calls/data/GetNews?outputMode=json&start=now-7d&end=now&count=25&q.enriched.url.enrichedTitle.entities.entity=|text=#{self.name},type=company|&return=enriched.url.url,enriched.url.title,enriched.url.author,enriched.url.docSentiment.score&apikey=#{ENV['ALCHEMY_DATA_KEY']}")
      news_response = Net::HTTP.get_response(uri)
      self.news_response = JSON.parse(news_response.body)
  end
end

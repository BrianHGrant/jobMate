class Company < ActiveRecord::Base
  validates_presence_of :name
  has_many :contacts
  has_many :jobs
  has_many :statuses
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
    begin
      news_response = JSON.parse(RestClient::Request.new(
      method: :get,
      url: "https://access.alchemyapi.com/calls/data/GetNews?apikey=#{ENV['ALCHEMY_DATA_KEY']}&return=enriched.url.title,enriched.url.url,enriched.url.author,enriched.url.publicationDate,enriched.url.enrichedTitle.docSentiment,enriched.url.enrichedTitle.concepts&start=now-7d&end=now&q.enriched.url.enrichedTitle.entities.entity=|text=" + self.name + ",type=company|&q.enriched.url.enrichedTitle.docSentiment.type=positive&count=25&&dedup=true&rank=medium&outputMode=json"
      ).execute)
      self.news_response = news_response
    rescue RestClient::BadRequest => error
      message = JSON.parse(error.response)['message']
      errors.add(:base, message)
      throw(:abort)
    end
  end
end

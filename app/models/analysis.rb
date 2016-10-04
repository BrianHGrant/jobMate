class Analysis < ActiveRecord::Base
  before_create :get_analysis
  serialize :response

  private
  def get_analysis
    begin
      response = JSON.parse(RestClient::Request.new(
      method: :get,
      url: "https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone",
      user: ENV['WATSON_USER_NUM'],
      password: ENV['WATSON_PWORD'],
      headers: {params: { text: self.text,
      version: "2016-05-19"}}
      ).execute)
      self.response = response
    rescue RestClient::BadRequest => error
      message = JSON.parse(error.response)['message']
      errors.add(:base, message)
      throw(:abort)
    end
  end
end

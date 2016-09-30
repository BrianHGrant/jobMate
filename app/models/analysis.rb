class Analysis < ActiveRecord::Base
  before_create :get_analysis
  serialize :response

  private
  def get_analysis
    begin
      response = JSON.parse(RestClient::Request.new(
      method: :get,
      url: "https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone",
      user: 'f24a1b1b-8ad5-4d29-9544-ab4d1fd44f47',
      password: "j3TBPZgUAN6T",
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

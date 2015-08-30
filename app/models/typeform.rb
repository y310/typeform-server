class Typeform < ActiveRecord::Base
  has_many :results

  define_model_callbacks :post
  before_post :add_webhook_submit_url

  after_create :post

  def post
    run_callbacks(:post) do
      result = client.post('/latest/forms', body).body
      update(
        form_id: result['id'],
        form_url: result['_links'].find {|l| l['rel'] == 'form_render' }['href'],
        form_definition: result
      )
    end
  end

  private

  def add_webhook_submit_url
    unless body['webhook_submit_url']
      body['webhook_submit_url'] = Rails.application.routes.url_helpers.typeform_results_url(self)
    end
  end

  def client
    @client ||= Faraday.new 'https://api.typeform.io', headers: { 'X-API-TOKEN': ENV['TYPEFORM_API_KEY'] } do |conn|
      conn.request :json
      conn.response :json, content_type: /\bjson$/
      conn.use :extended_logging, logger: Rails.logger

      conn.adapter Faraday.default_adapter
    end
  end
end

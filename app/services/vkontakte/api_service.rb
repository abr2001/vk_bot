# frozen_string_literal: true

class Vkontakte::ApiService < BaseService
  class Response < ::Hashie::Mash
    disable_warnings
  end

  def api_get(method, account, params)
    RestClient.proxy = proxy_string(account)

    # rubocop:disable Metrics/LineLength: Line is too long
    url = "#{url_vk}/#{method}?#{prepare_api_params(params)}v=#{ENV['VK_VERSION_API']}&access_token=#{account.token}"
    # rubocop:enable Metrics/LineLength: Line is too long

    response = parse_response RestClient.get uri(url)
    check_error(response, method, account)
    response
  end

  def api_post(method, account, params)
    RestClient.proxy = proxy_string(account)
    url = "#{url_vk}/#{method}?v=#{ENV['VK_VERSION_API']}&access_token=#{account.token}"
    response = parse_response RestClient.post uri(url), params
    check_error(response, method, account)
    response
  end

  def my_ip
    RestClient.proxy = proxy_string(account)
    parse_response RestClient.get uri(my_url)
  end

  private

  def my_url
    @my_url ||= 'http://ih1141221.vds.myihor.ru/api/v1/my_ip'
  end

  def proxy_string(account)
    # rubocop:disable Metrics/LineLength: Line is too long
    "https://#{account.proxy_user}:#{account.proxy_password}@#{account.proxy_ip}:#{account.proxy_port}"
    # rubocop:enable Metrics/LineLength: Line is too long
  end

  def check_error(response, method, account)
    return if response.error.blank?

    ApiVkErrorLog.create!(
      method: method,
      response: response,
      account: account,
      error_code: response.error.error_code
    )
  end

  def prepare_api_params(params)
    params_to_s = ''
    params.each { |key, value| params_to_s += "#{key}=#{value}&" }
    params_to_s
  end

  def parse_response(response)
    hash(JSON.parse(response))
  end

  def url_vk
    @url_vk ||= 'https://api.vk.com/method'
  end

  def hash(value)
    Response.new(value)
  end

  def rest_get(url)
    response = RestClient.get url
    JSON.parse(response)
  end

  def save_error(tail, error)
    tail.update(
      error_code: error['error_code'],
      captcha_sid: error['captcha_sid'],
      captcha_img: error['captcha_img']
    )
  end

  def uri(url)
    begin
      uri = URI.parse(url)
    rescue URI::InvalidURIError
      uri = URI.parse(CGI.escape(url))
    end
    uri.to_s
  end

  def need_captcha?(response)
    response&.error&.error_code&.eql?(14) || false
  end
end

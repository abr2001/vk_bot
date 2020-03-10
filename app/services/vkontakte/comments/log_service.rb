# frozen_string_literal: true

class Vkontakte::Comments::LogService < Vkontakte::ApiService
  def get
    CommentLog.includes(:account).order(id: :desc)
      .paginate(page: params[:page], per_page: params[:per_page])
      .map do |log|
        {
          log: log,
          account: log.account.code,
          date: log.created_at.localtime.strftime('%d.%m.%Y %k:%M:%S')
        }
      end
  end
end

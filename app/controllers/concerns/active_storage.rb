# frozen_string_literal: true

module ActiveStorage
  module SetCurrent
    before_action do
      ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
    end
  end
end

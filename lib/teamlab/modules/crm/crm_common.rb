# frozen_string_literal: true

module Teamlab
  # Methods for working with crm common methods
  module CrmCommon
    def get_currency_list
      @request.get(%w[settings currency])
    end

    def get_result_of_convertation(options = {})
      @request.get(%w[settings currency convert], options)
    end

    def get_summary_table(currency)
      @request.get(%w[settings currency summarytable], currency: currency)
    end

    def update_crm_currency(currency)
      @request.put(%w[settings currency], currency: currency)
    end

    def get_all_currency_rates
      @request.get(%w[currency rates], {})
    end

    def set_currency_rate(from = 'EUR', to = 'USD', rate = '1.0')
      @request.post(%w[currency rates], fromCurrency: from, toCurrency: to, rate: rate)
    end

    def get_currency_rate_by_id(id)
      @request.get(['currency', 'rates', id.to_s], {})
    end

    def delete_currency_rate_by_id(id)
      @request.delete(['currency', 'rates', id.to_s], {})
    end

    def set_is_portal_configured(options = {})
      @request.put(%w[settings], options)
    end
  end
end

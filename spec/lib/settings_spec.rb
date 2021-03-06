# frozen_string_literal: true

require_relative '../spec_helper'

describe '[Settings]' do
  let(:teamlab_module) { :settings }

  describe '#add_user' do
    it_behaves_like 'an api request' do
      let(:teamlab_module) { :people }
      let(:command) { :add_user }
      let(:args) { [false, random_email, random_word.capitalize, random_word.capitalize] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :user_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#get_settings' do
    it_behaves_like 'an api request' do
      let(:command) { :get_settings }
    end
  end

  describe '#get_sso_settings' do
    it_behaves_like 'an api request', :pending do
      pending 'only for self-hosted, error 500 when running on saas portal'
      let(:command) { :get_sso_settings }
    end
  end

  describe '#get_ldap_settings' do
    it_behaves_like 'an api request', :pending do
      pending 'only for self-hosted, error 500 when running on saas portal'
      let(:command) { :get_ldap_settings }
    end
  end

  describe '#get_logo' do
    it_behaves_like 'an api request' do
      let(:command) { :get_logo }
    end
  end

  describe '#get_usage_quota' do
    it_behaves_like 'an api request' do
      let(:command) { :get_usage_quota }
    end
  end

  describe '#get_version' do
    it_behaves_like 'an api request' do
      let(:command) { :get_version }
    end
  end

  describe '#get_version_build' do
    it_behaves_like 'an api request' do
      let(:command) { :get_version_build }
    end
  end

  describe '#get_white_label_sizes' do
    it_behaves_like 'an api request' do
      let(:command) { :get_white_label_sizes }
    end
  end

  describe '#get_security' do
    it_behaves_like 'an api request' do
      let(:command) { :get_security }
      let(:args) { [random_settings_entity_id] }
    end
  end

  describe '#get_admin_security' do
    it_behaves_like 'an api request' do
      let(:command) { :get_admin_security }
      let(:args) { [random_settings_entity_id, random_id(:user)] }
    end
  end

  describe '#get_product_admin' do
    it_behaves_like 'an api request' do
      let(:command) { :get_product_admin }
      let(:args) { [random_settings_entity_id] }
    end
  end

  describe '#set_version' do
    # TODO: You cannot change portal version to the same
    it_behaves_like 'an api request', :pending do
      let(:command) { :set_version }
      let(:args) { [1] }
    end
  end

  describe '#set_security' do
    it_behaves_like 'an api request' do
      let(:command) { :set_security }
      let(:args) { [random_settings_entity_id, { enabled: random_bool }] }
    end
  end

  describe '#set_access' do
    it_behaves_like 'an api request' do
      let(:command) { :set_access }
      let(:args) { [random_settings_entity_id, random_bool] }
    end
  end

  describe '#set_product_admin' do
    it_behaves_like 'an api request' do
      let(:command) { :set_product_admin }
      let(:args) { [random_settings_entity_id, random_id(:user)] }
    end
  end

  # wouldn't work with master, only 9.0
  # in order to test manually use: https://nctautotest-446955501-smoke-feed-spec.teamlab.info
  describe '#update_timezone_and_language' do
    it_behaves_like 'an api request' do
      let(:command) { :update_timezone_and_language }
      let(:args) { [SETTINGS_TIMEZONE, LANGUAGE.sample] }
    end
  end

  describe '#change_portal_default_page_to_default_page' do
    it_behaves_like 'an api request' do
      let(:command) { :update_default_portal_page }
      let(:args) { [SETTINGS_PORTAL_DEFAULT_PAGE_MODULE_CHOICE] }
    end
  end
end

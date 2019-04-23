require 'spec_helper'

describe '[CRM]' do
  let(:teamlab_module) { :crm }

  describe '#create_person' do
    it_should_behave_like 'an api request' do
      let(:teamlab_module) { :crm }
      let(:command) { :create_person }
      let(:args) { [random_word.capitalize, random_word.capitalize] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :new_contact_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_case' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_case }
      let(:args) { [random_word, { members: DATA_COLLECTOR[:new_contact_ids] }] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :crm_case_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_case_for_group_deleting' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_case }
      let(:args) { [random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :crm_case_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_case_for_group_deleting_by_filter' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_case }
      let(:args) { [random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :crm_case_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#get_cases_by_prefix' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_cases_by_prefix }
      let(:args) { [random_id(:new_contact), random_word] }
    end
  end

  describe '#get_case_list' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_case_list }
    end
  end

  describe '#add_case_contact' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_case_contact }
      let(:args) { [random_id(:crm_case), random_id(:new_contact)] }
    end
  end

  describe '#get_case_by_id' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_case_by_id }
      let(:args) { [random_id(:crm_case)] }
    end
  end

  describe '#get_all_case_contacts' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_all_case_contacts }
      let(:args) { [random_id(:crm_case)] }
    end
  end

  describe '#set_case_access_rights' do
    it_should_behave_like 'an api request' do
      let(:command) { :set_case_access_rights }
      let(:args) { [random_id(:crm_case), { isPrivate: random_bool }] }
    end
  end

  describe '#update_case' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_case }
      let(:args) { [random_id(:crm_case), random_word] }
    end
  end

  describe '#set_case_access_rights_by_filter' do
    it_should_behave_like 'an api request' do
      let(:command) { :set_case_access_rights_by_filter }
      let(:args) { [{ contactId: random_id(:new_contact), isPrivate: random_bool }] }
    end
  end

  describe '#close_case' do
    it_should_behave_like 'an api request' do
      let(:command) { :close_case }
      i = -1
      let(:args) { [DATA_COLLECTOR[:crm_case_ids][i += 1]] }
    end
  end

  describe '#resume_case' do
    it_should_behave_like 'an api request' do
      let(:command) { :resume_case }
      i = -1
      let(:args) { [DATA_COLLECTOR[:crm_case_ids][i += 1]] }
    end
  end

  describe '#set_rights_to_case' do
    it_should_behave_like 'an api request' do
      let(:command) { :set_rights_to_case }
      let(:args) { [random_id(:crm_case), isPrivate: random_bool] }
    end
  end

  describe '#delete_case_contact' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_case_contact }
      i = -1
      let(:args) { [DATA_COLLECTOR[:crm_case_ids][i += 1], random_id(:new_contact)] }
    end
  end

  describe '#delete_case' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_case }
      let(:args) { [DATA_COLLECTOR[:crm_case_ids].shift] }
    end
  end

  describe '#delete_case_group' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_case_group }
      let(:args) { [DATA_COLLECTOR[:crm_case_ids].pop] }
    end
  end

  describe '#delete_case_group_by_filter' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_case_group }
      i = -1
      let(:args) { [{ contactId: DATA_COLLECTOR[:new_contact_ids][i += 1] }] }
    end
  end
end
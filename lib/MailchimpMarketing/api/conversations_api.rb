=begin
#Mailchimp Marketing API

#No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)

OpenAPI spec version: 3.0.43
Contact: apihelp@mailchimp.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.12

=end

require 'uri'

module MailchimpMarketing
  class ConversationsApi
    attr_accessor :api_client

    def initialize(api_client)
      @api_client = api_client
    end

    # List conversations
    def list(opts = {})
      fail ArgumentError, 'invalid value for "opts[:"count"]", must be smaller than or equal to 1000.' if !opts[:'count'].nil? && opts[:'count'] > 1000
      fail ArgumentError, 'invalid value for "has_unread_messages", must be one of true, false' if opts[:'has_unread_messages'] && !['true', 'false'].include?(opts[:'has_unread_messages'])

      query_params = {}
      query_params[:'fields'] = @api_client.build_collection_param(opts[:'fields'], :csv) if !opts[:'fields'].nil?
      query_params[:'exclude_fields'] = @api_client.build_collection_param(opts[:'exclude_fields'], :csv) if !opts[:'exclude_fields'].nil?
      query_params[:'count'] = opts[:'count'] if !opts[:'count'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'has_unread_messages'] = opts[:'has_unread_messages'] if !opts[:'has_unread_messages'].nil?
      query_params[:'list_id'] = opts[:'list_id'] if !opts[:'list_id'].nil?
      query_params[:'campaign_id'] = opts[:'campaign_id'] if !opts[:'campaign_id'].nil?
      post_body = nil

      local_var_path = '/conversations'
      data = @api_client.call_api(:GET, local_var_path,
        :query_params => query_params,
        :body => post_body)
      return data
    end

    # Get conversation
    def get(conversation_id, opts = {})
      fail ArgumentError, "Missing required param: 'conversation_id'" if conversation_id.nil?

      query_params = {}
      query_params[:'fields'] = @api_client.build_collection_param(opts[:'fields'], :csv) if !opts[:'fields'].nil?
      query_params[:'exclude_fields'] = @api_client.build_collection_param(opts[:'exclude_fields'], :csv) if !opts[:'exclude_fields'].nil?
      post_body = nil

      local_var_path = '/conversations/{conversation_id}'.sub('{' + 'conversation_id' + '}', conversation_id.to_s)
      data = @api_client.call_api(:GET, local_var_path,
        :query_params => query_params,
        :body => post_body)
      return data
    end

    # List messages
    def get_conversation_messages(conversation_id, opts = {})
      fail ArgumentError, "Missing required param: 'conversation_id'" if conversation_id.nil?
      fail ArgumentError, 'invalid value for "is_read", must be one of true, false' if opts[:'is_read'] && !['true', 'false'].include?(opts[:'is_read'])

      query_params = {}
      query_params[:'fields'] = @api_client.build_collection_param(opts[:'fields'], :csv) if !opts[:'fields'].nil?
      query_params[:'exclude_fields'] = @api_client.build_collection_param(opts[:'exclude_fields'], :csv) if !opts[:'exclude_fields'].nil?
      query_params[:'is_read'] = opts[:'is_read'] if !opts[:'is_read'].nil?
      query_params[:'before_timestamp'] = opts[:'before_timestamp'] if !opts[:'before_timestamp'].nil?
      query_params[:'since_timestamp'] = opts[:'since_timestamp'] if !opts[:'since_timestamp'].nil?
      post_body = nil

      local_var_path = '/conversations/{conversation_id}/messages'.sub('{' + 'conversation_id' + '}', conversation_id.to_s)
      data = @api_client.call_api(:GET, local_var_path,
        :query_params => query_params,
        :body => post_body)
      return data
    end

    # Get message
    def get_conversation_message(conversation_id, message_id, opts = {})
      fail ArgumentError, "Missing required param: 'conversation_id'" if conversation_id.nil?
      fail ArgumentError, "Missing required param: 'message_id'" if message_id.nil?

      query_params = {}
      query_params[:'fields'] = @api_client.build_collection_param(opts[:'fields'], :csv) if !opts[:'fields'].nil?
      query_params[:'exclude_fields'] = @api_client.build_collection_param(opts[:'exclude_fields'], :csv) if !opts[:'exclude_fields'].nil?
      post_body = nil

      local_var_path = '/conversations/{conversation_id}/messages/{message_id}'.sub('{' + 'conversation_id' + '}', conversation_id.to_s).sub('{' + 'message_id' + '}', message_id.to_s)
      data = @api_client.call_api(:GET, local_var_path,
        :query_params => query_params,
        :body => post_body)
      return data
    end

    # Post message
    def create_conversation_message(conversation_id, body, opts = {})
      fail ArgumentError, "Missing required param: 'conversation_id'" if conversation_id.nil?
      fail ArgumentError, "Missing required param: 'body'" if body.nil?

      query_params = {}
      post_body = @api_client.object_to_http_body(body)

      local_var_path = '/conversations/{conversation_id}/messages'.sub('{' + 'conversation_id' + '}', conversation_id.to_s)
      data = @api_client.call_api(:POST, local_var_path,
        :query_params => query_params,
        :body => post_body)
      return data
    end
  end
end

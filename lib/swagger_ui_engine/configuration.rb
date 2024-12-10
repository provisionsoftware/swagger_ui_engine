module SwaggerUiEngine
  class Configuration
    # Configurable options
    OPTIONS = %i(
      admin_username
      admin_password
      doc_expansion
      json_editor
      model_rendering
      oauth_client_id
      oauth_client_secret
      oauth_realm
      oauth_app_name
      oauth_scope_separator
      oauth_query_string_params
      request_headers
      swagger_url
      api_versions_description
      translator_enabled
      validator_enabled
      explore_enabled
      header_color
      title
      bearer_token
    ).freeze

    attr_accessor(*OPTIONS)
  end
end

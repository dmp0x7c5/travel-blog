GrapeSwaggerRails.options.api_auth = "bearer"
GrapeSwaggerRails.options.api_key_name = "Authorization"
GrapeSwaggerRails.options.api_key_type = "header"
GrapeSwaggerRails.options.app_name = "Travel Blog"
GrapeSwaggerRails.options.before_action_proc = proc {
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port

  begin
    Pundit.authorize(current_user, :swagger, :show?)
  rescue Pundit::NotAuthorizedError
    redirect_to Rails.application.secrets.frontend_url
  end
}
GrapeSwaggerRails.options.doc_expansion = "list"
GrapeSwaggerRails.options.hide_api_key_input = false
GrapeSwaggerRails.options.hide_url_input = true
GrapeSwaggerRails.options.url = "/api/docs"

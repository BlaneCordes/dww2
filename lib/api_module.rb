module ApiModule

  def build_request(http_method, request_url, session)
    get_access_token(session)
    #need to make sure that session persists here or figure out a
    #way to redirect the user to reauthenticate.
    @response = @access_token.request(http_method, request_url)
    @response.body
  end


  private

  def get_access_token(session)
    if session[:access_token]
      @access_token = session[:access_token]
    else
      "You need to connect this app to the yahoo api"
      return false
    end
  end

end

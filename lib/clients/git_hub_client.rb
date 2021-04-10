# class GitHubClient
#   ROOT_ENDPOINT = "https://api.github.com".freeze
#   ACCESS_TOKEN  = "token".freeze

#   def initialize
#     @http_client = setup_http_client
#   end

#   def create_gist(params)
#     # @http_client.post("gists", params) do |request|
#     #   request.headers["Accept"]        = "application/vnd.github.v3+json"
#     #   request.headers["Authorization"] = "token #{ACCESS_TOKEN}"
#     #   request.headers["Content-Type"]  = "application/json"
#     #   request.body = params.to_json
#     # end

#     @http_client.create_gist(params)
#   end

#   private

#   def setup_http_client
#     # Faraday.new(url: ROOT_ENDPOINT)
#     Octokit.api_endpoint = ROOT_ENDPOINT

#     Octokit::Client.new(access_token: ACCESS_TOKEN)
#   end
# end

module OmniauthMacros
  def mock_omniauth
    # The mock_auth configuration allows you to set per-provider (or default)
    # authentication hashes to return during integration testing.
    OmniAuth.config.mock_auth[:github] = {
      "provider" => "github",
      "uid" => "12345",
      "info" => {
        "email" => "verdie@example.com",
        "name" => "Verdie",
      }
    }
  end
end
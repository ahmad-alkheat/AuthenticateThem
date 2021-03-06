Warden::Strategies.add(:password) do
	def valid?
		host = request.host
		subdomain = ActionDispatch::Http::URL.extract_subdomain(host,1)
		subdomain.present? && params['user']
	end

	def authenticate!
		if u = Subscribem::User.find_by(email: params['user']['email'])
			u.authenticate(params['user']['email']) ? success!(u) : fail!
		else
			fail!
		end
	end
end
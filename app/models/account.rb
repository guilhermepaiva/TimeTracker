class Account < ActiveRecord::Base

	RESTRICTED_SUBDOMAINS = %w(wwww)

	validates :subdomain, presence: true,
		uniqueness: { case_sensitive: false },
		format: { with: /\A[\w\-]+\Z/i, message: 'Contains invalid characters' },
		exclusion: { in: RESTRICTED_SUBDOMAINS, message: 'restricted' }

	before_validation :downcase_subdomain

private
	def downcase_subdomain
		self.subdomain = subdomain.try(:downcase)
	end
end

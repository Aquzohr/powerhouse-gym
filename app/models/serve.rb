class Serve < ApplicationRecord
	belongs_to :member, optional: true

	def self.search(search)
	  wildcard_search = "%#{search}%"

	  where("member.code LIKE :search OR member.firstname LIKE :search OR member.lastname LIKE :search OR member.nickname LIKE :search", search: wildcard_search)
	end

  def as_json(options={})

    if options[:index]
      return {
        member_code: self.member.code,
        member_fullname: "#{self.member.firstname} #{self.member.lastname}",
        date: self.date,
        checkin_time: self.checkin_time,
        checkout_time: self.checkout_time,
      }
    else
      super()
  	end

  end

end

class Member < ApplicationRecord
	has_many :serves

	def self.search(search)
	  wildcard_search = "%#{search}%"

	  where("code LIKE :search OR firstname LIKE :search OR lastname LIKE :search OR nickname LIKE :search", search: wildcard_search)
	end

	def edit_link(id)
	  "<a href='/members/#{id}/edit'>Edit</a>"
	end

	def remove_link(id)
	  "<a data-confirm='Are you sure?' rel='nofollow' data-method='delete' href='/members/#{id}'>Destroy</a>"
	end

 	def as_json(options={})

    if options[:index]
      return {
        code: self.code,
        fullname: "#{self.firstname} #{self.lastname}",
        nickname: self.nickname,
        member_type: self.member_type,
        bdate: self.bdate,
        regisdate: self.regisdate,
        expdate: self.expdate,
        pc_amount: self.pc_amount,
        pc_balance: self.pc_balance,
        edit: edit_link(self.id),
        remove: remove_link(self.id),
      }
    else
      super()
  	end

  end

end

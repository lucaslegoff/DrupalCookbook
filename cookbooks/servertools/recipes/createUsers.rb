if node["users"]

	node["users"].each do |key, userProp|
		user key do
			home "/home/#{key}"
			shell "/bin/bash"
			supports :manage_home => true
		end

		userProp["groups"].each do |groupName|
			group groupName do
				action :modify
				members key
				append true
			end
		end
	end

end
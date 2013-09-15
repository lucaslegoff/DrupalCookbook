if node["databases"] 
	include_recipe "database::mysql"

	node["databases"].each do |key, databaseProp|
		mysql_connection_info = {
	      :host => "localhost",
	      :username => "root",
	      :password => node["mysql"]["server_root_password"]
	    }

	    mysql_database key do
	      connection mysql_connection_info
	      action :create
	    end
	end
end
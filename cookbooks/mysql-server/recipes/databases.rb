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

	    mysql_database_user databaseProp["account_name"] do
		  connection mysql_connection_info
		  password databaseProp["account_pass"]
		  database_name key
		  host '%'
		  action :create
		end

		mysql_database_user databaseProp["account_name"] do
		  connection mysql_connection_info
		  database_name key
		  privileges [:all]
		  action :grant
		end
	end
end
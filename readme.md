Core utilities
==============

To use these, create a file in the folder with the utilities named ._domain_.token.  This file should contain your API token.  Domain should be the name of the core domain.  For example, to talk to core at core1.kuali.co, create a file named .core1.token with your API token in it.

Commands
========

All commands require the core domain to be the first command line argument.

* **add_user.rb** - Add a user.  The information about the new user must be put into this script for now.
* **delete_user.rb** - Delete a user.  Pass the user ID as the second command line argument.
* **get_current_user.rb** - Get information about your current user (the user that owns your API token).
* **get_user.rb** - Get information about a user.  Pass the user ID as the second command line argument.
* **list_users.rb** - List all users.


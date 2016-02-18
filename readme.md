Core utilities
==============

To use these, create a file in the folder with the utilities named ._domain_.token.  This file should contain your API token.  Domain should be the name of the core domain.  For example, to talk to core at core1.kuali.co, create a file named .core1.token with your API token in it.

Commands
========

All commands require the core domain to be the first command line argument.

* **add_user.rb** - Add a user.  The information about the new user must be put into a file.  The filename is passed to this program
* **delete_user.rb** - Delete a user.  Pass the user ID as the second command line argument.
* **get_current_user.rb** - Get information about your current user (the user that owns your API token).
* **get_user.rb** - Get information about a user.  Pass the user ID as the second command line argument.
* **list_users.rb** - List all users.

Sample Format for new user file
===============================

```javascript
{
  "name" : "Sample User",
  "password" : "password",
  "username" : "sample",
  "email" : "sample@email.edu",
  "role" : "user",
  "firstName" : "Sample",
  "lastName" : "User"
}
```

License
=======

Copyright 2016 Kuali

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

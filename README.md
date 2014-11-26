EMSEUPM - api
=============

Dependencies
------------

- rbenv
- ruby-build
- rbenv-gemsets (recommended)
- MySQL

Run
---

1. Install `rbenv`: follow instructions at https://github.com/sstephenson/rbenv#basic-github-checkout

2. Install `ruby-build`: follow instructions at https://github.com/sstephenson/ruby-build#installing-as-an-rbenv-plugin-recommended

3. Install `rbenv-gemsets`: follow instructions at https://github.com/jf/rbenv-gemset#github

4. Install `ruby 2.1.5` (you may need to log in and out before `rbenv` works properly)

        rbenv install 2.1.5

5. Install `bundler` for dependency management (**IMPORTANT** run this ONLY inside the project directory)

        gem install bundler --no-document

6. Install `gems`

        bundle

7. Configure your database settings on `config/database.yml`

8. Run `rails server`

9. Open http://localhost:3000

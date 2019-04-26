Redirector
=================

### Summary
  * A RESTful API with Ruby on Rails that:
  * Accepts an email address and full link and returns a short link code
  * Accepts a short link code and returns email address and original link
  * A form that allows users to manually submit to the above API and see the results
  * An endpoint that will redirect to the original URL.
    * (Submission of http://app/r/ will redirect to http://original_link/)
  * An asyncronous job that will trigger multiple webhooks whenever someone clicks
  * A report that shows the most popular URLs based on a given timespan.

### System dependencies

- Ruby version: `ruby-2.6.3`

### Setup

1. Install Homebrew (package manager):

  ```bash
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
    brew update
    brew tap homebrew/versions
  ```

2. Install Redis (cache):

  ```bash
    brew install redis
    ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
    brew services start redis
  ```

3. Install Postgres (db):

  ```bash
    brew install postgres
  ```

4. Install RVM (Ruby Version Manager):

  * https://rvm.io/rvm/install

  ```bash
    gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    \curl -L https://get.rvm.io | bash -s stable
    rvm requirements run
  ```

  * Close terminal and open new one

5. Install Git (version control):

  * Modify name/email below

  ```bash
    brew install git
    git config --global user.name "John Doe"
    git config --global user.email john.doe@example.com
    echo $'rvm_install_on_use_flag=1\nrvm_gemset_create_on_use_flag=1' > ~/.rvmrc
  ```

6. Install project:

  ```bash
    git clone git@github.com:scottmalone/redirector.git
    cd redirector
  ```

7. Install gems (Ruby libraries):

  ```bash
    gem install bundler
    bundle install
  ```

8. Bootstrap the databases

  ```bash
    rails db:create db:migrate
  ```

### Testing

1. Set up specs:

  ```bash
    RAILS_ENV=test rake db:migrate
  ```

2. Run specs:

  ```bash
    rspec
  ```

### Run in development mode

1. Turn on server (in one terminal):

  ```bash
    rails s
  ```

2. Turn on background job processor (in another terminal):

  ```bash
    sidekiq
  ```

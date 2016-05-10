# Patients #

## Install ##

```
git clone https://github.com/sven199109/patients.git
cd patients
bundle install
```
Then, `cp config/database.yml.example config/database.yml`, and set your password in it with the environment of production.

```
RAILS_ENV=production bundle exec rake db:create && rake db:migrate
RAILS_ENV=production bundle exec rake db:seed
```

## Run ##

```
SECRET_KEY_BASE=your_key_base RAILS_ENV=production bundle exec rails s 
```

Then, open your browser to view it at `http://localhost:3000`.

## Run Test ##

```
bundle exec rake db:test:prepare
bundle exec rspec spec
```

Have fun!

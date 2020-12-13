1. $ rails new hero_api --database=postgresql --api
2. $ cd hero_api
3. $ sudo adduser hero_api
4. Note password used for hero_api user
5. Make user root
6. $ sudo usermod -aG sudo hero_api
7. edit config/database.yml to add information credentials for user specified above.
```
test:
  adapter: postgresql
  encoding: unicode
  database: hero_api
  pool: 5
  username: hero_api
  password: peace2020

development:
  adapter: postgresql
  encoding: unicode
  database: hero_api
  pool: 5
  username: hero_api
  password: peace2020

production:
  adapter: postgresql
  encoding: unicode
  database: hero_api
  host: localhost
  pool: 5
  username: hero_api
  password: <%= ENV['DATABASE_PASSWORD'] %>
```
8.  $ su - postgres
9.  postgres@computer:~$ createuser hero_api
10. postgres@computer:~$ createdb hero_api
11. Provide the privileges to hero_api user
12. postgres@computer:~$ psql
13. postgres=# alter user hero_api with encrypted password 'peace2020';
    ALTER ROLE
14. postgres=# grant all privileges on database hero_api to hero_api;
    GRANT
15. Exit psql with \q
16. postgres@computer:~$ exit ---to exit out of postgres impersonation
17. $ rails g scaffold Hero name:string 
18. rake db:migrate
== CreateHeros: migrating ======================================
-- create_table(:heros)
   -> 0.0132s
== CreateHeros: migrated (0.0134s) =============================
19. $ rails g scaffold Villain name:string hero:references
20. rake db:migrate
== CreateVillains: migrating ===================================
-- create_table(:villains)
   -> 0.0267s
== CreateVillains: migrated (0.0269s) ==========================
21.
make sure: hero_api/app/models/hero.rb
class Hero < ApplicationRecord
  has_many :villains
end
make sure: hero_api/app/models/hero.rb
class Villain < ApplicationRecord
  belongs_to :hero
end
22. Check that you can make heros and villains
23. $ rails c
24. Make the first hero, Batman...
25. (inside of rails console)
    > b = Hero.new
    > b.name = "Batman"
    > b.save
    > b
24. Then make Joker, Batman's first villian
    => #<Hero id: 1, name: "Batman", created_at: "2020-12-01", updated_at: "2020-12-01">
    > j = Villain.new
    > j.name = "Joker"
    > j.hero = b
    > j.save
      ...
      => true 
    > Hero.first.villains
      ...
      => #<ActiveRecord::Associations::CollectionProxy [#<Villain id: 1, name: "Joker", hero_id: 1, created_at: "2020-12-13 18:05:50", updated_at: "2020-12-13 18:05:50">]> 
    > Villain.first.hero
      ...
      => #<Hero id: 1, name: "Batman", created_at: "2020-12-13 17:54:25", updated_at: "2020-12-13 17:54:25">
24.
# GET /heros
def index
  @heros = Hero.all
  render json: @heros, include: :villains
end

# GET /heros/1
def show
  render json: @hero, include: :villains
end

# GET /villains
def index
  @villains = Villain.all
  render json: @villains, include: :hero
end

# GET /villains/1
def show
  render json: @villain, include: :hero
end
25. $ rails s
26. Test with Postman, here are some screenshots
27. $ heroku login
28. $ git init
29. $ git add .
30. $ git commit -m "initial commit"
28. $ heroku create
29. $ git push heroku main

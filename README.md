# Elm Heroku Template

This is my default template for web apps using my favorite tools:

* [Phoenix](http://phoenixframework.org)
* [Haml](https://github.com/chrismccord/phoenix_haml)
* [Elm](http://elm-lang.org) (via [elm-brunch](https://github.com/madsflensted/elm-brunch))
* Heroku

Below are instructions for
* creating a new app from the template
* deploying the app to Heroku

## Creating a new app

Suppose you are starting a new project named "PlumCake".

* Clone this repository and give your folder a name:

  `git clone https://github.com/stefankreitmayer/elm-heroku-template.git plum_cake`

* `cd plum_cake`
* Batch-replace the strings `ElmHeroku` and `elm_heroku` respectively. I use the following Vim commands that I learned from [here](http://vimcasts.org/episodes/project-wide-find-and-replace). NB the second line requres [vim-abolish](https://github.com/tpope/vim-abolish).

  `:args {config,lib,priv,test,web}/**/**.ex{,s} mix.exs`

  `:argdo %S/elm_heroku/plum_cake/g`

  `:argdo update`

* Verify that the substitution went OK, e.g. in Vim `:Ack elm_heroku` / `:Ack ElmHeroku`
* Rename the contents of `lib`:

  `mv lib/elm_heroku lib/plum_cake`

  `mv lib/elm_heroku.ex lib/plum_cake.ex`

* Replace the string MY_APPLICATION in `config/prod.exs`
* Run `mix deps.get`
* Run `npm install`
* Run `mix ecto.create`
* Run `mix phoenix.server`

* In a browser, go to `localhost:4000` and expect a basic single-page application with client-side navigation.
* Run `./run-elm-tests.sh` and expect all tests to be green.
* Update README.md
* Commit your changes

Finally, disconnect your project from the template repository

`git remote remove origin`


## Heroku Deployment

The following instructions are a summary of [this official guide](http://www.phoenixframework.org/docs/heroku), from where I also copied the modifications to `config/prod.exs`, `web/channels/user_socket`, and `Procfile`. You can probably leave these files unchanged.

### Create the app + add buildpacks

`heroku create MY_APPLICATION_NAME`

`heroku buildpacks:add https://github.com/gjaldon/heroku-buildpack-phoenix-static.git`

`heroku buildpacks:add --index 1 https://github.com/HashNuke/heroku-buildpack-elixir`

### Environment variables

DATABASE_URL

`heroku addons:create heroku-postgresql:hobby-dev`

POOL_SIZE

`heroku config:set POOL_SIZE=18`

SECRET_KEY_BASE

`mix phoenix.gen.secret`

...and copy the resulting string to...

`heroku config:set SECRET_KEY_BASE="PASTE_THE_STRING_HERE"`

### Push and migrate

`git push heroku master`

`heroku run "POOL_SIZE=2 mix ecto.migrate"`

### Verify

`heroku logs`

Expect no errors.

`heroku open`

You should now see the example Elm app.

## Further reading

See the official guide for deploying Phoenix apps to Heroku: http://www.phoenixframework.org/docs/heroku

I recommend having a look at the [elm-brunch](https://github.com/madsflensted/elm-brunch) plugin and [why it's a great idea to use it](https://youtu.be/MgFDZx1LmOE?t=21m).

## Feedback / Contributing

NB This template reflects my personal preference of tools. It was built for my own purposes.

That said, feel free to use it at your own peril :) Any feedback, comments, bug reports, etc. are highly welcome.

I will try to keep the template up to date with the latest releases of Phoenix, Elm, etc.

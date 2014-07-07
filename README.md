## Vim Genius

Vim Genius is a flashcard program that helps people learn Vim.

## Setup

```
rake db:setup
```

Add a `.env` file to the root directory with the following:

```
ADMIN_PASSWORD='vimmaster'
```

That is not the actual password in production, it's just what the tests count on.

## Prebuilt lessons

There are prebuilt lessons in `db/seeds/`.

## Run Tests

Run `rake`.

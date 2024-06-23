# README

## Requirements

```shell
  ruby 3.3.1
```

## Problem

Build a single page application which allows input of a stock ticker and displays the following for the date range 1/1/2023 until 12/31/2023.
1. Average stock price in the given range (in this example it is from 1/1/2023 until 12/31/2023).
2. Maximum/Minimum volume in the given range
3. Maximum/Minimum stock price in the given range

## Constraints and Requirements

1. The React App should be composed of two components with a parent child relationship. The parent component should pass the ticker to be searched to a child component which displays the results.
2. Vanilla CSS or SCSS for styling is preferred.
3. The use of React Hooks is required.
4. The use of Redux to store the result of the API is required.
5. Backend should use ruby on rails in conjunction with the following polygon api for ticker data.

### Expected Deliverables (BACKEND - this repository)

- [X] Backend should use ruby on rails in conjunction with the following polygon api for ticker data.

### Expected Deliverables (FRONTEND)

The tasks part of the frontend was developed in a separate repository. You can find the repository on my github using the same name as this repository and adding the suffix `_client`

## Setup Ruby (only if you have not installed)

This project uses [asdf](https://asdf-vm.com/guide/getting-started.html). \
Follow the installation [instructions](https://asdf-vm.com/guide/getting-started.html#_3-install-asdf)

After installation you need to follow these steps:

```bash
# Add ruby plugin on asdf
$ asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git

# Install ruby plugin
$ asdf install ruby 3.3.1
```

## Setup Project

```bash
# run setup script to initialize database and install dependencies
$ bin/setup

# run project
$ bin/rails s

# initialize the database with the seed data
$ bin/rails db:setup
```

## Tests

```bash
# run all specs and generate coverage files
$ bin/rspec

# run all specs without coverage files (run in this mode when you want to run faster and don't need to look at the coverage)
$ NO_COVERAGE=true bin/rspec
```

## Linter

```bash
# run linter
$ bin/rubocop
```

## Decisions

The API key for communicating with the Polygon is stored in the application's encrypted credentials.

To modify the values, you can check the Rails manual on how to edit encrypted settings

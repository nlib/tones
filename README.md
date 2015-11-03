## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tones'
```

And then execute:

```console
$ bundle install
```
Or install it yourself as:

```console
$ gem install tones
```
To create necessary migration files and setup routes run on terminal :

```console    
$ rails generate tones    
```

## Usage

Tones stores rails translations in the database using a model approach. All strings are cached, so no db queries are made when loading the views. It also provides a user interface to manage translations. You can import/export translation strings to CSV.

All visible strings should be in the form
to(:this_is_my_string)

This will display like this:
 This is my string
if no translation is available.

## Guidelines

Use only small letters with underscores.

## Create and Update transalations using user interface

 You can find a CRUD interface to your translations at /tones. Important: To protect your translations you need to add a password into your environment like so:
```
TONES_PASSWORD='XYZ'
```
If that environment variable is not set, your translations are open to edit.
 

## Adding translations to the database from csv:

To export translation content to file

```
rake tones:write
```
Upload the file "public/tones.csv" to Google Docs (have conversion to google formats ON)

Edit the file online and download as CSV. Overwrite the old file.

To import from file

On rails Console: 

```console
rake tones:read
```

Push the code to live, and run the command on the console again

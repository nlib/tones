## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tones', :git => 'https://github.com/nlib/tones'
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

Tones stores rails translations in the database using a model approach. All strings are cached, so no DB queries are made when loading the views. It also provides a user interface to manage translations. You can import/export translation strings to CSV.

All visible strings should be in the form
```
   to(:this_is_my_string)
```

If no translation is available, this will display like this:
```
   This is my string
```

## Create and Update transalations using user interface

You can find a CRUD interface to your translations at /tones. Important: To protect your translations you need to add a password into your environment like so:
```
TONES_PASSWORD='MY-PASSWORD'
```
**If that environment variable is not set, your translations are open for everyone to edit!**

## Adding translations to the database from csv:

You can import and export translations to a CSV file. The file is currently stored in */public/tones.csv*. Please add this file
to your version control!

**Import from CSV**
```
   rake tones:read
```

**Export to CSV**
```
   rake tones:write
```
When you write to CSV, read is automatically called before. Since the write command will overwrite your *tones.csv*, this will prevent translations to be deleted.

**Google Docs**
You can upload the file "public/tones.csv" to Google Docs (have conversion to google formats ON)
Edit the file online and download as CSV. Overwrite the old file.

## Live Deploy
After pushing code live, run the *tones:read* command to upate your database.


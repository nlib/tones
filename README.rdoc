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

Tones provide translation feature in rails application.
It also provide user interface to manage translation, and import export feature for translation strings through file.

All visible strings should be in the form
to(:this_is_my_string)

This will display like this:
 This is my string
if no translation is available.

## Guidelines

Use only small letters with underscores.

## Create and Update transalation using user interface

Type /tones after root url of your app and open it. Then click on 'New tones' link fill detail about translation and save it. Can update and delete it later.

## Adding translations to the database from csv:

To export translation content to file

Run the rails console: 

```console
Tones::Tone.write_tones
```
Upload the file "public/tones.csv" to Google Docs (have conversion to google formats ON)

Edit the file online and download as CSV. Overwrite the old file.

To import from file

On rails Console: 

```console
Tones::Tone.read_tones
```

Push the code to live, and run the command on the console again
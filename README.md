# Customer preference centre

[![Build Status](https://travis-ci.com/jonesandy/customer-preferences.svg?branch=master)](https://travis-ci.com/jonesandy/customer-preferences)

----

## Program

Customers are able to set their preferences for receiving marketing information. The following options are available:

* On a specified date of the month [1-28]
* On each specified day of the week [MON-SUN] (collection)
* Every day
* Never

After receiving the input the system will produce a report of the upcoming 90 days. For each day that marketing material will be sent, the report shows which customers will be a recipient.

## Usage

Application is a command line application. Application requires Ruby version ```2.6.5```.

### Getting started

Clone repository.

If running RVM for Ruby management please install 2.6.5:

```bash
rvm install 2.6.5

# .ruby-version file should switch to correct Ruby version. If not run this command
rvm 2.6.5

```

An example file of the program in use was created in the root folder. This file contains formatted customer input and produces the output to the console. To run this file in the command line:

```bash
ruby example.rb
```

If interacting with the program in IRB, customer data for input should be formatted as follows:

```
[
  { id: 'A', mday: nil, day: nil, everyday: true, none: false },     
  { id: 'B', mday: 10, day: nil, everyday: false, none: false },
  { id: 'C', mday: nil, day: ['TUE', 'FRI'], everyday: false, none: false },
  { id: 'D', mday: nil, day: nil, everyday: false, none: true }
]
```

To run in IRB:

```bash

IRB 
> require_relative './lib/preferences.rb'
> preferences = Preferences.new([
    { id: 'A', mday: nil, day: nil, everyday: true, none: false },
    { id: 'B', mday: 10, day: nil, everyday: false, none: false },
    { id: 'C', mday: nil, day: ['TUE', 'FRI'], everyday: false, none: false },
    { id: 'D', mday: nil, day: nil, everyday: false, none: true }
])

preferences.create_preferences
```

The output will then be printed to the console.

<img src="./_imgs/Screenshot 2020-02-11 at 12.22.01.png">

### Tests

To run tests:

```bash

bundle install

#in the root folder
rspec
```

## My approach

I decided to break this down into as many components as possible. First I tackled the way the input would be constructed from the customer data. I decided on the format of:

```
[
  { id: 'A', mday: nil, day: nil, everyday: true, none: false },     
  { id: 'B', mday: 10, day: nil, everyday: false, none: false },
  { id: 'C', mday: nil, day: ['TUE', 'FRI'], everyday: false, none: false },
  { id: 'D', mday: nil, day: nil, everyday: false, none: true }
]
```

This would allow each customer record to have the full structure of data, even if they didn't select it. It allowed for consistent processing and also manipulation. I could then cycle through the array of hashes and pull out what I need to use.

Once this was constructed I tackled creating a calendar. I decided to break this out into a separate class, so if the format of the calendar needed to change it wouldn't effect any of the other code. It can generate by default 90 days but can also be changed on initialisation. I decided to create this element ahead of printing, so I could then combine this calendar with the customer data by cycling over each array and adding data when matches were found.

Once the final calendar was updated I sent it out to a display class to format how it would be displayed. This is so, if the output needed to be changed, a new Display model could be created and would just manipulate the calendar data as needed.



# Schema Information

## questions
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
asker_id    | integer   | not null, foreign key (references users)
bestAnser_id| integer   | default Null
title       | string    | not null,
body        | text      | not null,


## responses
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
question_id | integer   | not null, foreign key (references blogs)
responder_id| integer   | not null, foreign key (references users)
body        | text      | not null


## comments
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
response_id | integer   | not null
author_id   | integer   | not null, foreign key (references users)
body        | string    |

## votes
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
response_id | integer   | not null
user_id     | integer   | not null

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
email           | string    | not null, unique
password_digest | string    | not null,
fname           | string    |
lname           | string    |
session_token   | string    | not null, unique

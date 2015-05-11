# NYC stack-overflow

[Heroku link][heroku]

[heroku]: http://soon-too-come.com

## Minimum Viable Product
Nyc stack overflow is a clone of StackOverflow built on Rails and Backbone.
Users can:
<!-- This is a Markdown checklist. Use it to keep track of your progress! -->
- [ ] Create accounts
- [ ] Create sessions (log in)
- [ ] Create Questions
- [ ] Create Responoses
- [ ] View Questions and answers
- [ ] Post comment on questions and responses
- [ ] See your asked questions and replies
- [ ] Vote on responses
- [ ] Search for Questions by title
- [ ] select thwe best answer to your questions

## Design Docs
* [View Wireframes][views]
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

## Implementation Timeline

### Phase 1: User Authentication, Blog Creation (~1 day)
I will implement user authentication in Rails based on the practices learned at
App Academy. By the end of this phase, users will be able to create blogs using
a simple text form in a Rails view. The most important part of this phase will
be pushing the app to Heroku and ensuring that everything works before moving on
to phase 2.

[Details][phase-one]

### Phase 2: Viewing Blogs and Posts (~2 days)
I will add API routes to serve blog and post data as JSON, then add Backbone
models and collections that fetch data from those routes. By the end of this
phase, users will be able to create blogs and view both blogs and posts, all
inside a single Backbone app.

[Details][phase-two]

### Phase 3: Editing and Displaying Posts (~2 days)
[Details][phase-three]

### Phase 4: User Feeds (~1-2 days)

[Details][phase-four]

### Phase 5: Searching for Questions (~2 days)
I'll need to add `search` routes to the questions. On the
Backbone side, there will be a `SearchResults` composite view.

[Details][phase-five]

### Bonus Features (TBD)
- [ ] "vote up" button and counter for responses
- [ ] Activity history (e.g. likes, reblogs, taggings)
- [ ] Post types (image posts, quote posts, etc)
- [ ] Reblogging
- [ ] Multiple sessions/session management
- [ ] User avatars
- [ ] Typeahead search bar

[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
[phase-five]: ./docs/phases/phase5.md

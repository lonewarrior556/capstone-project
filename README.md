# NYC stack-overflow

[Heroku link][heroku]

[heroku]: http://capstone-project.herokuapp.com/

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

### Phase 1: User Authentication, Blog Creation (~2 day)
I will implement user authentication in Rails based on the practices learned at
App Academy. Users will be able to create questions using a simple text form in a Rails view, and then respond to those questions. The last part of this this phase willbe pushing the app to Heroku.

[Details][phase-one]

### Phase 2: Viewing Blogs and Posts (~2 days)
I will add API routes to serve questions and response data as JSON, then add Backbone models and collections that fetch data from those routes. By the end of this phase, users will be able to create questions and view both questions and responses, all inside a single Backbone app.

[Details][phase-two]

### Phase 3: Adding Comments and Votes to Responses, selecting best Response (~2 days)
next to every response will be a tally of votes, under it will be comments on the response, and and the best response will be hoisted to the top right under question if there is a best one.
[Details][phase-three]

### Phase 4: User Index Page (~1-2 days)
  the user will have an index page that suggests answering questions that have no best answer, and choosing best answers for questions he asked that have now been answered

[Details][phase-four]

### Phase 5: Searching for Questions (~2 days)
I'll need to add `search` routes to the questions. On the
Backbone side, there will be a `SearchResults` composite view.

[Details][phase-five]

### Bonus Features (TBD)
- [ ] "vote up" button and counter for responses
- [ ] Activity history (e.g. votes, answers, questions comments)
- [ ] Multiple sessions/session management
- [ ] User avatars
- [ ] Typeahead search bar
- [ ] Add views

[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
[phase-five]: ./docs/phases/phase5.md

# RepBoard

A portable reputation platform that lets freelancers collect structured client feedback and showcase a verified public profile.

## Setup Instructions

1. Clone the repo:
```bash
   git clone https://github.com/ghewitt95/repboard.git
   cd repboard
```

2. Install dependencies:
```bash
   bundle install
```

3. Set up the database:
```bash
   rails db:create
   rails db:migrate
```

4. Start the server:
```bash
   bin/server
```

## ERD
```
users                          reviews
-----------                    -----------
id (PK)                        id (PK)
email                          reviewer_id (FK → users)
display_name                   reviewee_id (FK → users)
reviewable (boolean)           body (text)
bio (text)                     stars (integer 1-5)
slug (string, unique)          created_at
encrypted_password             updated_at
```

- User has_many :reviews_given (foreign_key: reviewer_id)
- User has_many :reviews_received (foreign_key: reviewee_id)
- Review belongs_to :reviewer (User)
- Review belongs_to :reviewee (User)

## Screenshots

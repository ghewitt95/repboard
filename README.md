# RepBoard

A portable reputation platform that lets freelancers collect structured client feedback and showcase a verified public profile.

## Setup Instructions


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

# Teleswap-API
<https://teleswapapi.herokuapp.com/api>


#### Sign Up

```
POST api/users
```
Request Body:

```
{ firstName: String, lastName: String, username: String, email: String, password: String }
```

#### Log In

```
POST api/tokens
```
Request Body:

```
{ email: String, password: String }
```

## Every Endpoint Below Requires JWT token in Authorization Header


#### Get User

```
GET api/users/:id

Note: This endpoint should be used after logging in and decoding the JWT
token in the front end to get the userId to retrieve all user attributes.
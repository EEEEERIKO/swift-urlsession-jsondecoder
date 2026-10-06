# Swift URLSession & JSONDecoder

## Description

Swift networking practice using `URLSession` to fetch users from a REST API, parse JSON with `JSONDecoder`, and extract user emails.

---

## Task

Make a network request using `URLSession` to:

```text
https://jsonplaceholder.typicode.com/users
```

Parse the JSON response using `JSONDecoder` and extract the users' email addresses.

---

## Requirements

The implementation must:

- Make a network request using `URLSession`.
- Retrieve data from the JSONPlaceholder API.
- Parse the JSON response using `JSONDecoder`.
- Decode the response into Swift models.
- Extract users' email addresses.
- Print the emails to the console.
- Use no third-party networking libraries.

---

## Technologies

- Swift
- Foundation
- URLSession
- JSONDecoder
- REST API
- JSON
- Decodable

---

## API

The project uses the JSONPlaceholder `/users` endpoint:

```text
https://jsonplaceholder.typicode.com/users
```

The API returns an array of users containing information such as:

- `id`
- `name`
- `username`
- `email`
- `address`
- `phone`
- `website`
- `company`

Only the `email` property is required for this exercise.

---

## Implementation Flow

The application follows this flow:

```text
API URL
   ↓
URLSession
   ↓
HTTP Request
   ↓
Server Response
   ↓
Data
   ↓
JSONDecoder
   ↓
[User]
   ↓
map
   ↓
[String]
   ↓
User Emails
```

---

## Swift Model

The JSON response is represented using a `Decodable` model:

```swift
struct User: Decodable {
    let email: String
}
```

Only the required property is included because the exercise only requires extracting email addresses.

---

## Networking

The request is performed using `URLSession`:

```swift
let task = URLSession.shared.dataTask(with: url) { data, response, error in
    // Handle response
}

task.resume()
```

The request is asynchronous, so the response is handled inside the completion closure.

Because this implementation runs as a Command Line Tool, the process is kept alive using:

```swift
RunLoop.main.run()
```

until the asynchronous request finishes.

---

## JSON Decoding

Once the server response is received, `JSONDecoder` converts the raw `Data` into an array of `User` objects:

```swift
let decoder = JSONDecoder()

let users = try decoder.decode(
    [User].self,
    from: data
)
```

The `[User].self` type tells `JSONDecoder` that the JSON response contains an array of users.

---

## Extracting Emails

After decoding the response, `map` is used to extract the email addresses:

```swift
let emails = users.map { $0.email }
```

This transforms:

```text
[User]
```

into:

```text
[String]
```

The emails are then printed to the console.

---

## Expected Output

The first results should include:

```text
Sincere@april.biz
Shanna@melissa.tv
Nathan@yesenia.net
Julianne.OConner@kory.org
Lucio_Hettinger@annie.ca
```

The API returns additional users, so additional email addresses may also appear in the console.

---

## Error Handling

The implementation handles common failure cases:

### Network error

```swift
if let error {
    print("Network error:", error)
    exit(1)
}
```

### Missing data

```swift
guard let data else {
    print("No data received")
    exit(1)
}
```

### JSON decoding error

```swift
do {
    // Decode JSON
} catch {
    print("Decoding error:", error)
    exit(1)
}
```

---

## Key Concepts Practiced

This exercise demonstrates the fundamentals of networking in Swift:

- `URL`
- `URLSession`
- Asynchronous requests
- Completion handlers
- HTTP responses
- `Data`
- JSON
- `Decodable`
- `JSONDecoder`
- Array decoding
- `map`
- Basic error handling
- `RunLoop`

---

## Learning Flow

The main concept practiced in this task is the transformation:

```text
Remote JSON
    ↓
Data
    ↓
JSONDecoder
    ↓
Swift Model
    ↓
Array of Models
    ↓
Extract Required Data
```

This represents a fundamental pattern used when consuming REST APIs in iOS applications.

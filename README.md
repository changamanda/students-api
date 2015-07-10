# Write Your Own API in Rails

## Introduction

It's time to start writing your own API with Rails! You've been hired by Flatiron School to create a students API, which includes Cohort and Student objects. So exciting!

## Reviewing `respond_to`

The Rails API gives the following code as an example of web-service support:

```ruby
def index
  @people = Person.all

  respond_to do |format|
    format.html
    format.xml { render xml: @people }
  end
end
```

According to the API:

> What that says is, “if the client wants HTML in response to this action, just respond as we would have before, but if the client wants XML, return them the list of people in XML format.” (Rails determines the desired response format from the HTTP Accept header submitted by the client.)

If we want to respond to the action with JSON (which we will for our API), we can write:

```ruby
  respond_to do |format|
    format.json { render json: @people }
  end
```
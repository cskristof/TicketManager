# TicketManager

## Application setup

The project only uses SPM that is shipped with Swift, so this should be fulfilled by default.
1. Select a target device
2. Build the project

## Imrovement ideas

- Create an order model that contains all the necessary information to complete the process and is being transferred between screens.

## Server endpoint change

Currently the app operates with mock responses. Changing to a live endpoint would go like this:
1. In the `Network` class remove the `stubClosure` parameter from the provider initiation.
2. Set the URl in `TicketRouter`

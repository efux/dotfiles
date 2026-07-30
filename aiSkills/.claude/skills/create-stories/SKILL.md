---
description: Takes the current context, creates stories and stores them in the issue tracker.
---

# Process

## Gather information
- Analyse the context of the current information

## Break down into tasks
- Create a list of user stories and list the titles to the user.
- Check with the user if the scope of the stories is correct.

## Formulate user stories
- For each title create now the whole user story and store them into the directory .stories as a markdown file
- Identify dependencies between the stories

## Write stories to issue tracker
- Read the stories in .stories
- For each markdown create an issue using the git remote url for identifiying the issue tracker system
- Remove the markdown file after successful issue creation

# User story style and guardrails
- Stories contain a title
- Stories contain a description
- Stories should usually contain a feature that can be implemented without constraints.
- If other stories need to be done before mention so.
- Stories should be vertical slices containing ideally backend and frontend
- Stories should contain a list of **Acceptance Criteria** (from user perspective)
- Stories should be formulated from user perspective
- Stories can contain **Implementation Details** to help with implementation



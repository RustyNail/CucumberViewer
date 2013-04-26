# encoding: utf-8

Feature: Login to twitter
  As a user
  I want login twitter.
  So that I want to see tweets of friend

Scenario: If I login to twitter, I can see tweets of my friends.
  Given I have account of twitter
  When I login to twitter
  Then I should see tweets of friend

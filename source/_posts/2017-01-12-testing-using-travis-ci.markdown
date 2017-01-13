---
layout: post
title: "Automated Testing Using Travis CI"
date: 2017-01-12 17:40
comments: true
author: Brian O'Connor
categories: 
---

Mininet is now using Travis CI for automated testing! 

Whenever code is pushed to Mininet, Travis CI starts a test job
that installs Mininet, runs a simple sanity test, and the "quick"
tests for HiFi, the walkthrough, and the example code.

The full results are available on
[Travis CI's Mininet page](https://travis-ci.org/mininet/mininet),
and the status of the most recent master build is part of the README
on Github:

{% img /images/travis-ci-readme.png %}

Travis CI also verifies all new pull requests and displays their
build status in the pull request discussion.

Mininet will continue to be tested in several ways on private servers,
but our hope is that having a public-facing CI will give members
of the community a better sense of how Mininet is tested and the quality
of the codebase.
Furthermore, we hope that by automatically testing pull requests, we
will reduce the likelihood of merging broken code and reduce the
testing burden on maintainers.

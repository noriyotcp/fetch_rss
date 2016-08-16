# fetch_rss

This is a sample app for Rails5 API mode.

* Ruby 2.3.0p0
* Rails 5.0.0.1

## What's this?
It gets RSS feed from:
- [Hatena Bookmark](http://b.hatena.ne.jp) (Japanese)
- [hnrss.org (Hacker News RSS feeds)](https://edavis.github.io/hnrss/) (English)

---------

### root to: 'top#index'
It fetches articles from:
- http://b.hatena.ne.jp/hotentry/it.rss
- http://hnrss.org/newest

---------

### get 'hatebu', to: 'hatebu#fetch'
With no parameters, it fetches articles from:
- http://b.hatena.ne.jp/hotentry/it.rss

**With parameters**

``?tag=``

ex. https://yourapp.com/hatebu?tag=Swift

It also can have multiple parameters separated by ``,`` .

ex. https://yourapp.com/hatebu?tag=Swift,Rails



``&sort=``
- recent
- popular

ex. https://yourapp.com/hatebu?tag=Swift&sort=popular

---------

### get 'hnrss', to: 'hnrss#fetch'
With no parameters, it fetches articles from:
- http://hnrss.org/newest

**With parameters**

``?tag=``

ex. https://yourapp.com/hnrss?tag=Swift

It also can have multiple parameters separated by ``,`` .

ex. https://yourapp.com/hnrss?tag=Swift,Rails

``points=``

It fetches articles over (n) points.

ex. https://yourapp.com/hnrss?points=100

It also can be added after ``?tag=`` .

ex. https://yourapp.com/hnrss?tag=Swift,Rails&points=100

## Note
Things I have NOT done yet:
- Testing
- Deploying

*......Good Luck!*

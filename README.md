Getting setup
-------------

1. Clone the project
2. Make sure you have RVM installed.
3. cd to the project (it should install ruby-2.1.0@seattlediy for you)
4. Run `bundle install`
5. Run the tests:

```
In one console tab:

zeus start

In another:

bundle exec guard start
```

At the guard prompt, press Enter to run the tests. Or, change a spec file to re-run.

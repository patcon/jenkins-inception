Inception
=========

  - Source: https://github.com/myplanetdigital/inception

This project aims to be a Drupal continuous integration infrastructure
in a box. This currently includes:

  - Jenkins
  - Drush
  - PHP
  - a simple build job (configured via `misc/config.yml`)

**Inception is in active development at Myplanet Digital, and should be
considered alpha code. Stability and full documentation not yet
guaranteed.**

Goals
-----

Why don't most developers use continuous integration? We think it's
because it's hard to know where to start. We'd like to make it as simple
as entering your cloud provider credentials (Rackspace/AWS/whatever) and
running a single command.

Quickstart
----------

    $ curl -L get.rvm.io | bash -s 1.14.1
    $ source ~/.rvm/scripts/rvm
    $ git clone https://github.com/myplanetdigital/inception.git
    $ cd inception
    $ bundle exec librarian-chef install

Be sure to configure the settings in `misc/config.yml`.

The next steps vary based on how you'd like to launch the Inception
stack.

### Vagrant

If you have Vagrant installed, you can test the setup on local virtual
machines:

    $ bundle exec vagrant up  # Spin up the VM
    $ bundle exec vagrant ssh # SSH into the VM

You can now view the Jenkins UI at: http://localhost:8080

### Opscode Platform

Opscode platform is a hosted Chef server that is free for managing up to
5 servers. This should be more than enough for each project-specific CI
setup.

We'll be including various Rake tasks to automate the setup process as
much as possible. These rake tasks will attempt to use a browser
webdriver to fill out web forms and perform simple setup tasks for you.

You may view the available tasks from the project root by running `rake
-D` (for full descriptions) or `rake -T` (for short descriptions)

Known Issues
------------

  - Seemed that any restart of the VM causes Jenkins to be unavailable
    from the host, even though it's still running.

To Do
-----

  - Create a chef server as a multi-VM Vagrant environment (or use
    [Hatch][hatch-project]?)
  - Provide instructions on using with Opscode hosted Chef server?
  - Use watir-webdriver and rake to create an opscode hosted chef
    account and/or create a new hosted chef organization.
  - Include a base Drupal install profile to show file structure and
    bare minimum script expectations.
  - Add [spiceweasel][spiceweasel-project] support for launching into
    the cloud.

<!-- Links -->
   [hatch-project]:       http://xdissent.github.com/chef-hatch-repo/
   [spiceweasel-project]: http://wiki.opscode.com/display/chef/Spiceweasel 

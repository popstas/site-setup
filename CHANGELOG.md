
n.n.n / 2016-03-06
==================

  * removed version from readme, we should use git tags

v1.2.5 / 2015-12-29
===================

  * MaxClientsVHost 50 -> 30
  * apache2-mpm-itk per vhost clients limit

v1.2.4 / 2015-11-26
===================

  * fixed: drs cron-add was added job to root crontab

v1.2.3 / 2015-10-12
===================

  * dns, add SPF to bind template
  * site-setup, argument DB not passed to site-setup-engine
  * minor: todo
  * fix installer for run from any pwd

v1.2.2 / 2015-09-07
===================

  * installer without delete files

v1.2.1 / 2015-09-02
===================

  * minor: fixed version
  * config file search fix

v1.2.0 / 2015-09-02
===================

  * removed skeldir, $SCRIPT now run from root, tests fixes
  * drupal-setup, --config parameter

v1.1.1 / 2015-08-31
===================

  * setup-engine, fix drush7 detect

v1.1.0 / 2015-08-30
===================

  * tests docs
  * tests fix
  * user exists check
  * add  tests
  * installer fix
  * nginx test scope config, empty engine fix, exit codes fixes
  * syntax fixes, ide warnings
  * set -e, fixes of exit codes
  * set -e, user check in passwd
  * chmod +x
  * drush7 check
  * tests
  * fix ide warnings
  * fixed docs
  * extract files from single directory in sitedir
  * support --engine project:commerce_kickstart
  * moved site-setup-engine to script, removed --no_reinstall

v1.0.0 / 2015-08-29
===================

  * templates
  * installer, config, docs
  * First commit, not working project
  * Initial commit

> :warning: **UNMAINTAINED PLATFORM.SH EXAMPLE PROJECT** :warning:
>
> [Platform.sh Examples](https://github.com/platformsh-templates) are proof of concepts. While they can be used as reference, they are generally unmaintained once published. Feel free to use them as a starting point for your work, but remember that [Platform.sh Templates](https://github.com/platformsh-templates) are the only example projects with regular maintenance.
>
> When working with example projects:
>
> 1. Consult the [examples information page](https://docs.platform.sh/development/templates#examples.html) of the documentation for any major API changes that have occurred since the example was archived.
> 2. Upgrade all configurations used in this example to the most recently supported version for each service and runtime, as newer versions may come with important security fixes. Click the link for each service used in this example below to find the most recent versions:
>     * [Python 3.7](https://docs.platform.sh/languages/python.html#supported)
>     * [MariaDB 10.4](https://docs.platform.sh/configuration/services/mysql.html#supported-versions)
>     * [Redis 5.0](https://docs.platform.sh/configuration/services/redis.html#supported-versions)

# Logz.io log shipping for Platform.sh

This is a starter example for shipping logs from Platform.sh to Logz.io. Consult the [Community post](https://community.platform.sh/t/how-to-forward-platform-sh-logs-to-logz-io/197) for more information.

The example has been configured to send all Platform.sh logs from `/var/log/` to a configured Logz.io account. The application uses the [Platform.sh Flask template](https://github.com/platformsh-templates/flask).

## Customizations

The following files have been added to the [Platform.sh Flask template](https://github.com/platformsh-templates/flask). If using this project as a reference for your own existing project, replicate the changes below to your project.

> **Note:**
>
> Before making these changes to your project, make sure to set an environment variable called `LOGZIO_TOKEN` to the value of your Logz.io token. You can find your token in your [account settings](https://app.logz.io/#/dashboard/settings/manage-accounts).

* The `install_filebeat.sh` script run during the build hook installs the Filebeat log shipper and runs two tests for the Filebeat CLI.
* `filebeat.yml` is the main configuration file used to define the location logs are shipped from, their type, and listening host on Logz.io. It reads a user's "token" from an environment variable.
* `platform.app.yaml` has been modified to:
    * run the install script for Filebeat in the build hook.
    * Detect changes to the tracked log files and ship during the deploy hook.
    * Defines 3 mounts necessary for Filebeat to keep track of how logs change in local JSON files.


## References

* [Logz.io](https://logz.io/)
* [Platform.sh Templates](https://github.com/platformsh-templates)
* [Platform.sh Examples Documentation](https://docs.platform.sh/development/templates#examples.html)
* [Platform.sh Community How-to: How to forward Platform.sh logs to Logz.io](https://community.platform.sh/t/how-to-forward-platform-sh-logs-to-logz-io/197)
* [Platform.sh Flask Template](https://github.com/platformsh-templates/flask)
* [Python on Platform.sh](https://docs.platform.sh/languages/python.html)

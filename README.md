# discourse-custom-ignore-trust
A tiny Discourse plugin that allows customization of the trust level required to ignore users. Discourse is very opinionated about this.

This will add a new site setting to the Plugins page which lets you customize the minimum trust level required to ignore other users. Note that the UI will still only show the option to ignore a user if the current user is above the configured threshold to send PMs.

Note that this completely *overrides* the Guardian's logic for `can_ignore_users?` so it's likely to be fragile if that logic changes.

As an extra feature, there is another setting that modifies the Job that purges IgnoredUsers so that it will no longer purge IgnoredUsers older than four months, only ones which have expired. This is useful if you're ignoring users via the API for longer than is allowed via Discorse's UI. This also may be fragile, thanks to some hardcoded stuff in the original Job.

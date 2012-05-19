README
------

To use, set the `PACKAGE_VERSION` and any `PROXY` value you might need first.

Then, add preflight or postflight scripts if you want and uncomment/add to the payload. The preflight checks for a specific version. I should make it more dynamic rather than have you edit the string, but there you go. I'll add it to my "rainy day" tasks.

The override.ini included is just a blank file. Use a real one if you need it.

If you want to include extensions, copy the expanded folders to the root of this folder and add them to the payload with `pack-ff-ext-[name of folder]`. This assumes you want to dump the extensions in the app bundle itself. I'm not sure if Mozilla is still encouraging this practice. If so, it's easy to automate bundling a CCK extension this way, for instance.

Let me know if this is useful or if you have any questions.

Thanks,

Nate

cf. [extension installation details](https://developer.mozilla.org/en/Installing_extensions)
cf. [krypted deploy notes](http://krypted.com/mass-deployment/deploying-and-managing-firefox-the-rough-guide/)
cf. [greg neagle's notes](http://managingosx.wordpress.com/2012/02/28/firefox-10-esr-and-cck-notes/)

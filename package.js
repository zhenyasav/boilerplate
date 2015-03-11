Package.describe({
  name: 'zhenya:boilerplate',
  version: '0.0.1',
  summary: 'Less Coffee boilerplate',
  // URL to the Git repository containing the source code for this package.
  git: 'https://github.com/zhenyasav/meteor-boilerplate',
  // By default, Meteor will default to using README.md for documentation.
  // To avoid submitting documentation, set this field to null.
  documentation: 'README.md'
});

Package.onUse(function(api) {
  
  api.use([
    'less', 
    'coffeescript', 
    'underscore', 
    'templating',
    'iron:router@1.0.7']);

  api.addFiles(['utils.coffee']);

  api.addFiles([
    'colors.import.less',
    'shades.import.less',
    'utils.import.less',
    'reset.import.less',
    'for.import.less',
    'clearfix.import.less',
    'all.import.less',
    'helpers.coffee',
    'colors.html',
    'colors.coffee',
    'debug.less',
    'debug.coffee'
    ], 'client');

});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('zhenya:boilerplate');
});

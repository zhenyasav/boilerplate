Package.describe({
  name: 'zhenya:boilerplate',
  version: '0.0.1',
  summary: 'Common patterns and utils',
  // URL to the Git repository containing the source code for this package.
  git: '',
  // By default, Meteor will default to using README.md for documentation.
  // To avoid submitting documentation, set this field to null.
  documentation: 'README.md'
});

Package.onUse(function(api) {
  //api.versionsFrom('1.0.3.1');
  
  api.use([
    'less', 
    'coffeescript', 
    'underscore', 
    'templating',
    'iron:router@1.0.7']);

  //api.use(['iron:router@1.0.7'], {weak:true});

  api.addFiles(['utils.coffee']);

  api.addFiles([
    'colors.import.less',
    'shades.import.less',
    'utils.import.less',
    'for.import.less',
    'all.import.less',
    'helpers.coffee',
    'colors.html',
    'colors.coffee'
    ], 'client');

});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('zhenya:boilerplate');
});

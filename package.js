Package.describe({
  name: 'zhenya:boilerplate',
  version: '0.0.1',
  summary: 'Less Coffee boilerplate: less imports, utils and helpers',
  git: 'https://github.com/zhenyasav/meteor-boilerplate',
  documentation: 'README.md'
});

Package.onUse(function(api) {
  
  api.use([
    'less', 
    'coffeescript', 
    'underscore', 
    'templating',
    'iron:router']);

  api.addFiles(['utils.coffee']);

  api.addFiles([
    'swatches/swatches.import.less',

    'colors.import.less',
    'shades.import.less',
    'utils.import.less',
    'reset.import.less',
    'for.import.less',
    'clearfix.import.less',
    'all.import.less',
    
    'helpers.coffee',
  
    'debug/debug.less',
    'debug/debug.coffee',

    'swatches/swatches.html',
    'swatches/swatches.coffee'

    ], 'client');

});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('zhenya:boilerplate');
});

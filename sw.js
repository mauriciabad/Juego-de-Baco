var CACHE_NAME = 'baco-v0.3.3';

var urlsToCache = [
  '.',
  'main.css',
  'index.html',
  'index.js',
  'playing.html',
  'playing.js',
  'editor.html',
  'editor.js',
  'media/house.svg',
  'ripple.min.css',
  'https://fonts.googleapis.com/css?family=Quicksand:300,400,700'
];

self.addEventListener('install', function(event) {
  event.waitUntil(
    caches.open(CACHE_NAME).then(function(cache) {
      return cache.addAll(urlsToCache);
    })
  );
});

self.addEventListener('activate', function(event) {
  event.waitUntil(
    caches.keys().then(function(cacheNames) {
      return Promise.all(
        cacheNames.filter(function(cacheName) {
          return cacheName != CACHE_NAME;
        }).map(function(cacheName) {
          return caches.delete(cacheName);
        })
      );
    })
  );
});

self.addEventListener('fetch', function(event) {
  event.respondWith(
    fetch(event.request).catch(function() {
      return caches.match(event.request);
    })
  );
});
var CACHE_NAME = 'baco-v0.3.1';

var urlsToCache = [
  '.',
  'index.html',
  'index.js',
  'main.css',
  'playing.html',
  'playing.js',
  'media/house.svg',
  'modes/abebersehadicho.json',
  'modes/bodytwister.json',
  'modes/entrelaespadaylapared.json',
  'modes/lamoneda.json',
  'modes/perdiendolaropa.json',
  'modes/quienes.json',
  'modes/yonunca.json',
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
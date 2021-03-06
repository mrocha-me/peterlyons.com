projectRoot = "#{__dirname}/.."
exports.site = "localhost"
exports.port = 9000
exports.baseURL = "http://#{exports.site}:#{exports.port}"
exports.appURI = "/app"
#Listen on all IPs in dev/test (for testing from other machines),
#But loopback in staging/prod since nginx listens on the routed interface
exports.loopback = false
exports.errorPages = true
exports.titleSuffix = " | Peter Lyons"
exports.staticDir = "#{projectRoot}/../static"
exports.photos =
  photoURI: "/photos/"
  galleryURI: exports.appURI + "/photos"
  galleryDir:  exports.staticDir + "/photos"
  thumbExtension: "-TN.jpg"
  extension: ".jpg"
  galleryDataPath: "#{projectRoot}/../data/galleries.json"
  serveDirect: true
exports.tests = false
exports.blog =
  hashPath: "#{projectRoot}/../data/blog_password.bcrypt"
  postBasePath: "#{projectRoot}/../data/posts"
switch process.env.NODE_ENV
  when "production", "staging"
    exports.site = "peterlyons.com"
    exports.baseURL = "http://#{exports.site}"
    exports.loopback = true
    exports.photos.serveDirect = false
    exports.errorPages = false
  when "staging"
    exports.site = "staging.peterlyons.com"
    exports.baseURL = "http://#{exports.site}"
    exports.loopback = true
    exports.photos.serveDirect = false
  else
    exports.tests = true
    exports.blogPreviews = true

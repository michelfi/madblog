// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "trix";

import Trix from "trix";

document.addEventListener("trix-file-accept", function(event) {
  const acceptedTypes = ["image/jpeg", "image/png", "image/jpg", "image/gif"];
  if (!acceptedTypes.includes(event.file.type)) {
    event.preventDefault();
    alert("Seules les images JPEG, PNG, JPG et GIF sont autorisées.");
  }
});
